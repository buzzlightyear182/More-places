class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :participation
      t.references :author
      # t.references :reviewee
      t.text :content
      t.float :score
      # t.boolean :confirmed?
      t.timestamps
      t.timestamps
    end
  end
end
