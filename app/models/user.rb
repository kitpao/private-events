class User < ApplicationRecord
  has_many :created_events, class_name: "Event", foreign_key: :host_id
  has_many :created_invitations, through: :created_events, source: :invitations
  has_many :received_invitations, class_name: "Invitation", foreign_key: :invited_id
  has_many :attended_events, through: :received_invitations, source: :event
end
