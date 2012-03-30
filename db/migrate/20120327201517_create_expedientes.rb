class CreateExpedientes < ActiveRecord::Migration
  def change
    create_table :expedientes do |t|
      t.integer :numero
      t.string :letra, :limit => 3
      t.integer :tipo
      t.integer :pasada
      t.integer :numsenado
      t.integer :tema
      t.text :descrip
      t.date :fechaentr
      t.string :hora, :limit => 5
      t.string :autor, :limit => 30
      t.text :firmantes
      t.integer :tipoentr
      t.integer :tipoperiod
      t.integer :numperiodo
      t.string :expte, :limit => 10
      t.integer :estado
      t.integer :ley
      t.integer :marca
      t.integer :etiq

      t.timestamps
    end
  end
end

