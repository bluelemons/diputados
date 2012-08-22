class AddIniciadorIdToNotas < ActiveRecord::Migration
  def change
    add_column :notas, :iniciador_id, :integer
  end
end
