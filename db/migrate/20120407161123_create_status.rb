class CreateStatus < ActiveRecord::Migration
  def change
    create_table :status, :primary_key => 'estado' do |t|
      t.string :nombre, :limit => 20

      t.timestamps
    end
  end
end

