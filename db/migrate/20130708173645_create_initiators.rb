class CreateInitiators < ActiveRecord::Migration
  def change
    create_table :initiators do |t|
      t.string :name

      t.timestamps
    end
  end
end
