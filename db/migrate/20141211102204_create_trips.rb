class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.belongs_to :user
      t.belongs_to :destination
      t.date :from_date
      t.date :to_date
      t.text :description
      t.integer :capacity
      t.timestamps
    end
  end
end
