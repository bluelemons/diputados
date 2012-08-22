class CreateIniciadorTipos < ActiveRecord::Migration
  def change
    create_table :iniciador_tipos do |t|
      t.string :name

      t.timestamps
    end
  end
end
