class Customer < ApplicationRecord
	belongs_to :user
	validates :first_name, :last_name, :email, presence: true
	has_many :estimates

	def full_name
	  "#{first_name} #{last_name}"
	end

	def formatted_phone
	  ActionController::Base.helpers.number_to_phone(self.phone, area_code: true)
	end

end
