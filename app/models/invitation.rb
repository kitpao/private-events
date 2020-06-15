class Invitation < ApplicationRecord
  belongs_to :invited, class_name: "User"
  belongs_to :event
end
