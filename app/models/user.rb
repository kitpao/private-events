class User < ApplicationRecord
  has_many :invitations, foreign_key: :host_id
end
