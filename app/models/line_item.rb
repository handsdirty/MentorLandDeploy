class LineItem < ActiveRecord::Base
  # attr_accessible :title, :body
	belongs_to :course
	belongs_to :student
	
	attr_accessible :course_id, :user_id
	#validates_uniqueness_of :course_id, scope: [:user_id]
end
