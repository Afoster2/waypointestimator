class Customer < ApplicationRecord
	belongs_to :user
	validates :first_name, :last_name, :email, presence: true
	has_many :estimates
end
