class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.belongs_to :expert, foreign_key: {to_table: :users}

      t.string :title
      t.text :purpose
      t.text :est_duration

      t.timestamps
    end
  end
end
