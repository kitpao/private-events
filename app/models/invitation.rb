class Invitation < ApplicationRecord
  belongs_to :host, class_name: "User"
  belongs_to :invited, class_name: "User"
  belongs_to :event
end
