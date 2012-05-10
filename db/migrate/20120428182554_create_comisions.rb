class CreateComisions < ActiveRecord::Migration
  def change
    create_table :comisions do |t|
      t.string :nombre
      t.integer :pte
      t.integer :vice
      t.integer :int1
      t.integer :int2
      t.integer :int3
      t.integer :int4
      t.integer :int5
      t.integer :int6
      t.integer :int7
      t.integer :int8
      t.integer :int9

      t.timestamps
    end
  end
end

