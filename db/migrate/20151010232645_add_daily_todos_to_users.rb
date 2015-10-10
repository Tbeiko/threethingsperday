class AddDailyTodosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :daily_todos, :integer
  end
end
