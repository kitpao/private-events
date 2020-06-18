class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :invitations
  has_many :inviteds, through: :invitations, source: :invited

  scope :upcoming_events, -> { where('date >= ?', Time.now) }
  scope :previous_events, -> { where('date < ?', Time.now) }
end
