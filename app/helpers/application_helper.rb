module ApplicationHelper

  def person_has_been_added(person_id)
    unique_pc_ids = User.all.pluck(:pc_id).uniq
    unique_pc_ids.include?(person_id.to_i)
  end


end
