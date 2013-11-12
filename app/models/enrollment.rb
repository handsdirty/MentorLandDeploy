class Enrollment < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  attr_accessible :user_id, :course_id
	#validates_uniqueness_of :course_id, scope: [:user_id]
end

