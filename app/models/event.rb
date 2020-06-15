class Event < ApplicationRecord
  belongs_to :host
  has_many :invitations
  has_many :invited, through: :invitation #{where:} only if accepted: yes
end
