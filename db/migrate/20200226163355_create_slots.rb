class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.datetime :start
      t.datetime :end
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
