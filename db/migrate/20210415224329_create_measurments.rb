class CreateMeasurments < ActiveRecord::Migration[6.1]
  def change
    create_table :measurments do |t|
      t.references :user, null: false, foreign_key: true
      t.date :week
      t.integer :weightKG
      t.integer :weightStone
      t.integer :weightPounds
      t.integer :bodyFat

      t.timestamps
    end
  end
end
