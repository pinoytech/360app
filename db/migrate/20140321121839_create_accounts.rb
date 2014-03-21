class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.text :description
      t.text :address
      t.string :telephone
      t.string :email

      t.timestamps
    end
  end
end
