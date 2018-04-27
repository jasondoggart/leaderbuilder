module ApplicationHelper

  def person_has_been_added(person_id)
    unique_pc_ids = User.all.pluck(:pc_id).uniq
    unique_pc_ids.include?(person_id.to_i)
  end

  def role_relationship_following_role_type(leading_role_type)
    case leading_role_type
    when 'Director'
      'Coach'
    when 'Coach'
      'Team Leader'
    when 'Team Leader'
      'Team Member'
    end
  end

  def role_relationship_leading_role_type(leading_role_type)
    case leading_role_type
    when 'Coach'
      'Director'
    when 'Team Leader'
      'Coach'
    when 'Team Member'
      'Team Leader'
    end
  end
  def show_leading_role(role)
    if role.leaders.count > 0
      role.leaders.first.role_details
    else
      "No #{role_relationship_leading_role_type(role.role_type).downcase} assigned"
    end
  end
end
