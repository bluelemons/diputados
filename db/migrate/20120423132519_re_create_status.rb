class ReCreateStatus < ActiveRecord::Migration
  def up
    drop_table :status

    create_table :status do |t|
      t.integer :estado
      t.string :nombre, :limit => 20

      t.timestamps
    end
  end

  def down
    drop_table :status

    create_table :status, :primary_key => 'estado' do |t|
      t.string :nombre, :limit => 20

      t.timestamps
    end
  end
end

