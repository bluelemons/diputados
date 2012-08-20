class CreateNotas < ActiveRecord::Migration
  def change
    create_table :notas do |t|
      t.integer :fojas

      t.timestamps
    end
  end
end
