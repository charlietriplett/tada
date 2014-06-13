class TodoList < ActiveRecord::Base

  validates :title, presence: true, length: { in: 3..120 }
  
  validates :description, presence: true, length: { in: 5..1000 }

  
end
