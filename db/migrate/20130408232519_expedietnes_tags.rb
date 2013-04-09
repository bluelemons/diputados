class ExpedietnesTags < ActiveRecord::Migration
  def change
    create_table :expedientes_tags, :id => false do |t|
      t.integer :expediente_id
      t.integer :tag_id
    end
  end
end
