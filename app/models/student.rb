class Student < User
  has_many :courses, through: :enrollments
  has_many :courses, through: :line_items
	has_many :credit_cards, through: :hascreditcards
end
