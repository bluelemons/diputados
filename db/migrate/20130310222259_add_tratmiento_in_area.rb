class AddTratmientoInArea < ActiveRecord::Migration
  def change
    add_column :areas, :tratamiento, :boolean
  end
end
