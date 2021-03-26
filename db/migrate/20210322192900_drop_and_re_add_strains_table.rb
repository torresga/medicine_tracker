class DropAndReAddStrainsTable < ActiveRecord::Migration[6.0]
  def change
    create_table(:strains) do |t|
      t.string :name
      t.string :brand
      t.string :strain_type
      t.string :form
      t.text :notes
      t.references :user, foreign_key: true
    end
  end
end
