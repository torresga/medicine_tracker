class AddReferenceToStrains < ActiveRecord::Migration[6.0]
  def change
    add_reference :strains, :user, foreign_key: true
  end
end
