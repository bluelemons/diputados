class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references, id: false do |t|
      t.integer :from_id
      t.integer :to_id
    end

    add_index :references, :to_id
    add_index :references, :from_id
  end
end
