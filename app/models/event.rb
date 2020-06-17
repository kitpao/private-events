class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :invitations
  has_many :inviteds, through: :invitations, source: :invited



  #event1.invitations.first.invited
end
