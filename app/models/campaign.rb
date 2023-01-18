class Campaign < ApplicationRecord
  validates :title, presence: true
  validates :purpose, presence: true

  belongs_to :expert, class_name: "User"
  has_many :todos, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :discussion_topics, dependent: :destroy
  has_many :campaigns_tags
  has_many :tags, through: :campaigns_tags
  enum status:
  {
    within_1_week: "within_1_week",
    within_1_month: "within_1_month",
    within_3_week: "within_3_months"
  }


  scope :can_have_topic, ->(user) { joins(:discussion_topics).where(discussion_topics: {novice_id: user}).count}
  # campaign.joins(:discussion_topics).where(discussion_topics: {novice_id: current_user.id}).count
end