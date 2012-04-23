class RenameExpedientesLegacyIndex < ActiveRecord::Migration
  def up
    rename_index :expedientes,
      'index_expedientes_on_numero_and_pasada_and_letra_and_tipo',
      'index_expedientes_on_legacy_id'
  end

  def down
    rename_index :expedientes,
      'index_expedientes_on_legacy_id',
      'index_expedientes_on_numero_and_pasada_and_letra_and_tipo'
  end
end

