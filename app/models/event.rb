class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :invitations
  has_many :inviteds, through: :invitations, source: :invited

  def self.upcoming_events
    self.where('date >= ?', Time.now)
  end
  scope :previous_events, -> { where('date < ?', Time.now) }
end
