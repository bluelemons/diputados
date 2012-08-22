class CreateIniciadors < ActiveRecord::Migration
  def change
    create_table :iniciadors do |t|
      t.string :name
      t.integer :iniciador_tipo_id
      t.integer :nota_tipo_id

      t.timestamps
    end
  end
end
