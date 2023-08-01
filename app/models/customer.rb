class Customer < ApplicationRecord
	belongs_to :salesperson, class_name: 'User'
end
