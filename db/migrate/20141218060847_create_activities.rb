class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.timestamps
    end

    add_belongs_to :experiences, :activities
  end
end
