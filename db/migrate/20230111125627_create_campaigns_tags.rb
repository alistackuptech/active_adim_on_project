class CreateCampaignsTags < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns_tags do |t|
      t.belongs_to :campaign
      t.belongs_to :tag
      t.timestamps
    end
  end
end
