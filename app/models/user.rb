class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password
  has_secure_password validations: false
  has_many :todos

  # Kind of counts the todos done today but not 100% functionnal
  # Best way to test this is to add something in the views (user/show) that is conditional to "todays_todos" being > than something
  # It will look something like 
  # <% if current_user.todays_todos > 3 $> 
  # do something
  # <% end %>

  def todays_todos
    self.daily_todos = 0
    self.todos.all.each do |todo|   
      if todo.created_today?
        self.daily_todos += 1
      end
    end
  end

  def todo_limit_exceeded?
    (self.daily_todos >= 3)
  end
end