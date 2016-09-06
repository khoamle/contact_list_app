require 'rails_helper'

describe Contact do
  it { should belong_to :user }
  it { should have_many :group_contacts }
  it { should have_many :groups }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }

  # Testing model without FactoryGirl
  it "is valid with a first name, last name and email" do
    contact = Contact.new(
      first_name: 'John',
      last_name: 'Frank',
      email: 'dick@msn.com')
    expect(contact).to be_valid
  end

  # Testing validation with FactoryGirl
  it "is invalid without an email" do
    contact = build(:contact, email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank", "is invalid")
  end

  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end
end
