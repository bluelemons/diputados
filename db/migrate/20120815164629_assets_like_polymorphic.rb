class AssetsLikePolymorphic < ActiveRecord::Migration
  def change
    remove_column :assets, :expediente_id
    add_column :assets, :adjuntable_id, :integer
    add_column :assets, :adjuntable_type, :string
  end
end
