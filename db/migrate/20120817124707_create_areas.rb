class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string  :name
      t.integer :area_id
      t.string  :type

      t.timestamps
    end
  end
end

