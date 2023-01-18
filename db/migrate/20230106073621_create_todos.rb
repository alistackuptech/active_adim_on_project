class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.belongs_to :campaign, foreign_key: true
      t.text :task

      t.timestamps
    end
  end
end
