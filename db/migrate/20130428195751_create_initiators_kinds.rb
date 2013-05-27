class CreateInitiatorsKinds < ActiveRecord::Migration
  def change
    create_table :initiators_kinds do |t|
      t.string :name

      t.timestamps
    end
    add_index :initiators_kinds, :name
  end
end
