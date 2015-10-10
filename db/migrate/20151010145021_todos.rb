class Todos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.string :status
      t.timestamps null: false
    end
  end
end
