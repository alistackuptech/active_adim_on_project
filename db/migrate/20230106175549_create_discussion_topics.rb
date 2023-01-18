class CreateDiscussionTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :discussion_topics do |t|
      t.belongs_to :novice, foreign_key: {to_table: :users}
      t.belongs_to :campaign, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
