class Contact < ActiveRecord::Base

  def full_name 
    "#{first_name} #{middle_name} #{last_name}"
  end

  def friendly_time 
    updated_at.strftime("%b %d, %Y")
  end

  def jap_phone_zone
    "+81 #{phone_number}"
  end
end
