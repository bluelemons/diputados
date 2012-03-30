class CreateFinals < ActiveRecord::Migration
  def change
    create_table :finals do |t|
      t.integer :numero
      t.string :letra, :limit => 3
      t.integer :tipo
      t.integer :pasada
      t.integer :nota
      t.integer :nronota
      t.date :fechanota
      t.integer :nroexpte
      t.date :respu
      t.date :archi
      t.integer :tomo
      t.integer :ley
      t.integer :decreto
      t.date :promu
      t.integer :veto
      t.integer :tipoveto
      t.integer :expveto
      t.date :caducado

      t.timestamps
    end
  end
end

