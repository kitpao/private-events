class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :host, class_name: "User"
end
