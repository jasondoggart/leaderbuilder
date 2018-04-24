class FetchUsers

  def initialize(last_name)
    @last_name = last_name.downcase
  end

  def get_people
    require 'uri'
    require 'net/http'

    people_url = URI(
      "https://api.planningcenteronline.com/people/v2/people?where[last_name]=" + @last_name
    )

    http = Net::HTTP.new(people_url.host, people_url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(people_url)
    request["content-type"] = 'application/json'
    request.basic_auth ENV['PLANNING_CENTER_APPLICATION_ID'],
      ENV['PLANNING_CENTER_SECRET']

    people_list = http.request(request)
    people = JSON.parse(people_list.body)


    people_hash = Hash.new
    people['data'].each do |person|
      person_id = person['id']
      email_url = URI(
        "https://api.planningcenteronline.com/people/v2/people/" + person_id + "/emails"
      )
      email_http = Net::HTTP.new(email_url.host, email_url.port)
      email_http.use_ssl = true
      email_request = Net::HTTP::Get.new(email_url)
      email_request.basic_auth ENV['PLANNING_CENTER_APPLICATION_ID'],
        ENV['PLANNING_CENTER_SECRET']
      email = JSON.parse(email_http.request(email_request).body)
      puts "email = "



      people_hash[person_id.to_sym] = Hash.new

      people_hash[person_id.to_sym][:last_name] = person['attributes']['last_name']
      people_hash[person_id.to_sym][:first_name] = person['attributes']['first_name']
      if email['meta']['total_count'] > 0
        people_hash[person_id.to_sym][:email] = email['data'][0]['attributes']['address']
      else
        people_hash[person_id.to_sym][:email] = nil
      end

    end
    people_hash
  end


end
