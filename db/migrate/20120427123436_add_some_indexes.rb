class AddSomeIndexes < ActiveRecord::Migration
  def change
    add_index :finals, :numero
    add_index :asuntos, :numero
    add_index :estados, :numero
    add_index :sesions, :numero
  end
end

