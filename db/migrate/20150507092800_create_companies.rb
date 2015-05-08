class CreateCompanies < ActiveRecord::Migration
  def up
    create_table :companies do |t|
      t.string :name
      # Photo Upload here

      t.timestamps null: false
    end
  end

  def down
    drop_table :companies
  end
end
