class CreateStrains < ActiveRecord::Migration[6.0]
  def change
    create_table :strains do |t|
      t.string :name
      t.string :brand
      t.string :type
      t.string :form

      t.timestamps
    end
  end
end
