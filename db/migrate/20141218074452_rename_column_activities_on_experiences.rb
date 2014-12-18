class RenameColumnActivitiesOnExperiences < ActiveRecord::Migration
  def change
    remove_belongs_to :experiences, :activities
    add_belongs_to :experiences, :activity
  end
end
