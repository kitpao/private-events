class Event < ApplicationRecord
  belongs_to :host, class_name: 'User' 
  has_many :invitations
  has_many :invited, class_name: 'User', through: :invitation #{where:} only if accepted: yes
end
