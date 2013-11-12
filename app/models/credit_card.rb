class CreditCard < ActiveRecord::Base
	has_one :students, through: :hascreditcards
  attr_accessible :billing_address, :card_type, :first_name, :last_name, :month, :number, :verification_value, :year
	PAYMENT_TYPES = [ "Visa", "Master", "Discover", "American Express" ]
	validates :card_type, inclusion: PAYMENT_TYPES
	
	def last_digits(number)     
		number.to_s.length <= 4 ? number : number.to_s.slice(-4..-1) 
	end
	def mask(number)
		"XXXX-XXXX-XXXX-#{last_digits(number)}"
	end
	def display_number
		mask(number)
	end
end
