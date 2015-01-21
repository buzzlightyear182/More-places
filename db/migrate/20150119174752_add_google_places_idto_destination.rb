class AddGooglePlacesIdtoDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :google_places_id, :string
  end
end

