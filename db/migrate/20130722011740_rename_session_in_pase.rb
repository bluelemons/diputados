class RenameSessionInPase < ActiveRecord::Migration
  def change
    rename_column :pases, :session_id, :weekly_session_id
  end
end
