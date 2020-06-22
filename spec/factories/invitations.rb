FactoryBot.define do
  factory :invitation do
     host{nil}
     event{nil}
     status{}
  end
end

=begin
  t.integer "host_id"
    t.integer "invited_id"
    t.integer "event_id"
    t.string "status", default: "pending"
=end
