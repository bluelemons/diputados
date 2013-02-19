class CreatePases < ActiveRecord::Migration
  def change
    create_table :pases do |t|
      t.integer :nota_id
      t.integer :area_id
      t.text :descripcion
      t.date :ingreso

      t.timestamps
    end
  end
end
