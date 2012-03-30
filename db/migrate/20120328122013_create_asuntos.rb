class CreateAsuntos < ActiveRecord::Migration
  def change
    create_table :asuntos do |t|
      t.integer :numero
      t.string :letra, :limit => 3
      t.integer :tipo
      t.integer :pasada
      t.integer :asuntoentr
      t.date :fechaasen
      t.integer :numreunion
      t.integer :numsesion
      t.integer :asunto
      t.integer :comision1
      t.integer :comision2
      t.integer :comision3
      t.integer :comision4
      t.integer :comision5
      t.integer :comision6

      t.timestamps
    end
  end
end

