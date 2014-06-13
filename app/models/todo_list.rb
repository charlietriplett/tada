class TodoList < ActiveRecord::Base

  validates :title, presence: true, length: { in: 3..120 }
  
  
end
