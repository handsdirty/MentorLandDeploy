class Course < ActiveRecord::Base
  belongs_to :mentor
  has_many :students, through: :enrollments
	has_many :students, through: :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
  attr_accessible :user_id, :capacity, :description, :location, :name, :price, :time

  validates :user_id, :presence => true
  validates :name, :presence => true
  validates :capacity, :inclusion => 1..100 
  validates :price, :inclusion => 1..100
	private
    # ensure that there are no line items referencing this course
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
