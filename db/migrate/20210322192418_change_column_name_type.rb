class ChangeColumnNameType < ActiveRecord::Migration[6.0]
  def change
    change_column :strains, :type, :strain_type
  end
end
