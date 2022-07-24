class Group < ApplicationRecord
  
  has_one_attached :group_image
  
  has_many :group_users
  has_many :users, through: :group_users
  
  validates :group_name, presence: true
  
end