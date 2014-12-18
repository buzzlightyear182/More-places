class AddColumnToActivitiesAndDestinations < ActiveRecord::Migration
  def change
    add_column :activities, :category, :string
    add_index :activities, :category, unique: true
    add_column :destinations, :country, :string
    add_index :destinations, :country, unique: true
  end
end
