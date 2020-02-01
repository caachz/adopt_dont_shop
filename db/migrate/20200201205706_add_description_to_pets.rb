class AddDescriptionToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :description, :string
    change_column :pets, :adoption_status, :string, :default => "Adoptable"
  end
end
