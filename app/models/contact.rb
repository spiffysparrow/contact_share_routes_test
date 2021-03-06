class Contact < ActiveRecord::Base

  validates :user_id, :presence => true, :uniqueness => {:scope => :email}
  validates :email,  :presence => true, :uniqueness => {:scope => :user_id}
  validates :name, presence: true


  belongs_to(
  :owner,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: 'User'
  )

  has_many :contact_shares,
    foreign_key: :contact_id,
    primary_key: :id,
    class_name: "ContactShare"

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  has_many :comments, as: :commentable
end
