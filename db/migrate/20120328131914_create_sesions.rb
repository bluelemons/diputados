class CreateSesions < ActiveRecord::Migration
  def change
    create_table :sesions do |t|
      t.integer :numero
      t.integer :tipo
      t.string :letra, :limit => 3
      t.integer :pasada
      t.integer :tipoperiod
      t.integer :numperiodo
      t.integer :ordendia
      t.date :fechaordia
      t.integer :numreunion
      t.integer :numsesion
      t.integer :asunto
      t.date :fechases
      t.integer :tratamient
      t.integer :resuvotac
      t.integer :comision1
      t.integer :comision2
      t.integer :comision3
      t.integer :comision4
      t.integer :comision5
      t.integer :comision6
      t.text :observ
      t.integer :wp

      t.timestamps
    end
  end
end

