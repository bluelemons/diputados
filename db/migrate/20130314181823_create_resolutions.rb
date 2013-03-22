class CreateResolutions < ActiveRecord::Migration
  def change
    create_table :resolutions do |t|
      t.text :body
      t.integer :pase_id

      t.timestamps
    end
    add_index :resolutions, :pase_id
  end
end
