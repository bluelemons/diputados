class CreateInitiators < ActiveRecord::Migration
  def change
    create_table :initiators do |t|
      t.string :name
      t.references :initiators_kind

      t.timestamps
    end
    add_index :initiators, :name
    add_index :initiators, :initiators_kind_id
  end
end
