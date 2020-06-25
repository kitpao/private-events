class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :host
      t.text :description
      t.string :location
      t.date :date
      
      t.timestamps
    end
  end
end
