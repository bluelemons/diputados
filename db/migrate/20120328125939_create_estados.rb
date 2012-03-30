class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.integer :numero
      t.string :letra, :limit => 3
      t.integer :tipo
      t.integer :pasada
      t.date :fechaent
      t.integer :comision
      t.date :tratamses
      t.date :fechasal
      t.text :dictmay
      t.text :dictmin1
      t.text :dictmin2
      t.date :fechamay
      t.date :fechamin1
      t.date :fechamin2
      t.integer :v

      t.timestamps
    end
  end
end

