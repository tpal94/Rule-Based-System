class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  belongs_to :organization, optional: true
  has_many :strategies
  has_many :country_users
	has_many :countries, through: :country_users  
	# has_many :zone_users
	# has_many :zones, through: :zone_users  
  has_many :state_users
	has_many :states, through: :state_users  
  has_many :city_users
  has_many :cities, through: :city_users  
  has_many :category_users
  has_many :categories, through: :category_users
end
