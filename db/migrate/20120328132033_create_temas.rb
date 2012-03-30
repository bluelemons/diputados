class CreateTemas < ActiveRecord::Migration
  def change
    create_table :temas do |t|
      t.integer :tema
      t.string :nombre, :limit => 25

      t.timestamps
    end
  end
end

