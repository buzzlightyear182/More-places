class AddGooglePlacesIdtoDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :google_places_id, :string
    add_index :destinations, :google_places_id, unique: true
  end
end

