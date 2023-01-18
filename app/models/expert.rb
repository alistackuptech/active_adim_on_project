class Expert < User
    # validates :profession, presence: true
    # validates :service, presence: true

    validates_presence_of :profession, :service

    has_many :campaigns, dependent: :destroy

end
