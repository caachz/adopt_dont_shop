class ChangeShelter < ActiveRecord::Migration[5.1]
  def change
    rename_column :pets, :shelter, :shelter_id
  end
end
