class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password
  has_secure_password validations: false
  has_many :todos

  def todays_todos
    @todays_todos = 0
    self.todos.all.each do |todo|   
      if todo.created_today?
        @todays_todos += 1
      end
    end
    @todays_todos
  end

end