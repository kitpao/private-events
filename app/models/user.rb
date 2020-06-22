class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', foreign_key: :host_id, dependent: :destroy
  has_many :created_invitations, through: :created_events, source: :invitations, dependent: :destroy
  has_many :received_invitations, class_name: 'Invitation', foreign_key: :invited_id, dependent: :destroy
  has_many :attended_events, through: :received_invitations, source: :event

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { minimum: 3, maximum: 50 }
end
