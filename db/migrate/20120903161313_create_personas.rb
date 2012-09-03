class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :name
      t.string :type
      t.string :dni

      t.timestamps
    end
  end
end
