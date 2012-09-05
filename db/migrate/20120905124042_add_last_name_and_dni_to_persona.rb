class AddLastNameAndDniToPersona < ActiveRecord::Migration
  def change
    add_column :personas, :last_name, :string
    add_column :personas, :dni, :string
    add_column :personas, :tipo_dni, :integer
  end
end
