class RemovingInciadorTipoIniciadorNotaTipo < ActiveRecord::Migration
  def up
    drop_table :iniciador_tipos
    drop_table :iniciadors
    drop_table :nota_tipos

    remove_column :notas, :iniciador_id
  end
end
