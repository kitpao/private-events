class User < ApplicationRecord
  has_many :created_events, class_name: "Event", foreign_key: :host_id
  has_many :invitations, through: :created_events, source: :host
  has_many :invitations, foreign_key: :invited_id
end
