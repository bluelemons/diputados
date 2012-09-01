class MovingFojasToPase < ActiveRecord::Migration
  def up
    remove_column :notas, :fojas
    add_column :pases, :fojas, :integer
  end
end
