class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|

      t.timestamps
    end
  end
end
