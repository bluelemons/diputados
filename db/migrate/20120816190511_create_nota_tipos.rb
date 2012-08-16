class CreateNotaTipos < ActiveRecord::Migration
  def change
    create_table :nota_tipos do |t|
      t.string :name
      t.string :letra

      t.timestamps
    end
  end
end
