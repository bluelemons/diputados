class CreateDictamen < ActiveRecord::Migration
  def change
    create_table :dictamen do |t|
      t.text :cuerpo
      t.references :pase

      t.timestamps
    end
    add_index :dictamen, :pase_id
  end
end
