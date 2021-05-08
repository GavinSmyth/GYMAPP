class CreatePtClients < ActiveRecord::Migration[6.1]
  def change
    create_table :pt_clients do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :number

      t.timestamps
    end
  end
end
