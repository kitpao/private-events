class User < ApplicationRecord
  has_many :created_events, class_name: "Event", foreign_key: :host_id
  has_many :invitations, through: :created_events

  #User.first.created_events.first.invitations

end
