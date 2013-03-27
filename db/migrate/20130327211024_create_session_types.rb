class CreateSessionTypes < ActiveRecord::Migration
  def change
    create_table :session_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
