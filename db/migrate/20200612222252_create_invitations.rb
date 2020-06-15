class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :host
      t.references :invited
      t.references :event
      t.string  :status, default: "pending"
      t.timestamps
    end
  end
end
