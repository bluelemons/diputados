class SetAllExpedientesAsProyectos < ActiveRecord::Migration
  def up
    execute <<-SQL
      UPDATE expedientes
      SET type = 'Proyecto'
    SQL
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

