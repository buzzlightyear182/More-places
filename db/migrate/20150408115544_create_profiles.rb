class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.text :description
      t.float :rating
      t.timestamps
    end
  end
end
