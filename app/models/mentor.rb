class Mentor < User
  has_many :courses

  searchable do
    text :name
  end

end
