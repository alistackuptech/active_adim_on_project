class CampaignsTag < ApplicationRecord
    belongs_to :campaign
    belongs_to :tag
end
