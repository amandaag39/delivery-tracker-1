class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.string :description
      t.text :details
      t.date :supposed_to_arrive_on
      t.integer :user_id
      t.boolean :arrived

      t.timestamps
    end
  end
end