class CreateCoordinates < ActiveRecord::Migration[6.0]
  def change
    create_table :coordinates do |t|
      t.integer :order
      t.float :longitude
      t.float :latitude
      t.string :incident_category
      t.text :student_answer
      t.references :flashcard, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
