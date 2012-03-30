class CreatePrefers < ActiveRecord::Migration
  def change
    create_table :prefers do |t|
      t.integer :numero
      t.string :letra, :limit => 3
      t.integer :tipo
      t.integer :pasada
      t.integer :preferen
      t.date :fechapref
      t.date :fechasol
      t.integer :tratado

      t.timestamps
    end
  end
end

