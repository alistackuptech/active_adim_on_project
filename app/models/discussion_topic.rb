class DiscussionTopic < ApplicationRecord
    validates :title, presence: true

    belongs_to :campaign
    belongs_to :novice, class_name: "User"
    has_many :comments, :as=> :commentable, dependent: :destroy

end
