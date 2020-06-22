class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :invitations
  has_many :inviteds, through: :invitations, source: :invited

  scope :upcoming_events, -> { where('date >= ?', Time.now) }
  scope :previous_events, -> { where('date < ?', Time.now) }

  validates :description, presence: true,
                          uniqueness: { case_sensitive: false }

  validates :location, presence: true

  validates :date, presence: true
end
