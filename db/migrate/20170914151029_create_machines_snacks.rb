class CreateMachinesSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :machines_snacks do |t|
      t.references :machine, foreign_key: true
      t.references :snack, foreign_key: true

      t.timestamps
    end
  end
end
