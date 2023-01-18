class Tag < ApplicationRecord
    validates :title, presence: true
    has_many :campaigns_tags
    has_many :campaigns, through: :campaigns_tags
end
