class User < ApplicationRecord
  has_many :events, foreign_key: :host_id
  has_many :invitations, through: :events, source: :host

  has_many :invitations, foreign_key: :invited_id
  has_many :events, through: :invitations, source: :invited
end
