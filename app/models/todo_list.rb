class TodoList < ActiveRecord::Base

  has_many :todo_items

  validates :title, presence: true, length: { in: 3..120 }
  
  validates :description, presence: true, length: { in: 5..1000 }

end
