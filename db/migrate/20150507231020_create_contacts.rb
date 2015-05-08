class CreateContacts < ActiveRecord::Migration
  def up
    create_table :contacts do |t|
      t.integer :company_id
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end

  def down
    drop_table :contacts
  end
end
