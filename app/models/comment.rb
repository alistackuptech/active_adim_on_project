class Comment < ApplicationRecord
    validates :title, presence: true
    belongs_to :commentable, polymorphic: true 
    belongs_to :user
    # belongs_to :user
end
