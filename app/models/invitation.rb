class Invitation < ApplicationRecord
  belong_to :host, class_name: "User"
  belong_to :invited, class_name: "User"
  belong_to :event
end
