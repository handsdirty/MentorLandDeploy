class Hascreditcard < ActiveRecord::Base
  # attr_accessible :title, :body
	belongs_to :credit_card
	belongs_to :student
	
	attr_accessible :credit_card_id, :user_id
end
