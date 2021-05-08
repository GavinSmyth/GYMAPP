class CreateGymClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :gym_classes do |t|
      t.integer :PT_id
      t.string :PT_name
      t.string :Class_type
      t.date :Date
      t.time :Time

      t.timestamps
    end
  end
end
