namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    Contact.populate 100 do |contact|
      contact.first_name    = Faker::Name.first_name
      contact.last_name = Faker::Name.last_name
      contact.email   = Faker::Internet.email
      contact.phone_number   = Faker::PhoneNumber.cell_phone
    end
  end
end

