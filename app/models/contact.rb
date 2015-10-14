class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :group_contacts
  has_many :groups, through: :group_contacts

  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  def full_name 
    "#{first_name} #{middle_name} #{last_name}"
  end
end
