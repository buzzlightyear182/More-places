class RemoveIndexOnGooglePlacesId < ActiveRecord::Migration
  def change
    remove_index :destinations, column: :google_places_id
  end
end
