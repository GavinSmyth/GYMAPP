class CreatePersonalTrainers < ActiveRecord::Migration[6.1]
  def change
    create_table :personal_trainers do |t|
      t.string :name
      t.string :email
      t.string :number
      t.string :description
      t.integer :noOfClient

      t.timestamps
    end
  end
end
