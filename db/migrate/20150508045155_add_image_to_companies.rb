class AddImageToCompanies < ActiveRecord::Migration
  def up
    add_column :companies, :image, :string
  end

  def down
    remove_column :companies, :image, :string
  end
end
