class Novice < User
    before_create :set_default_values
    has_many :discussion_topics, dependent: :destroy
    protected

    def set_default_values
      self.profession = nil;
      self.service= nil;
    end
end
