class AddProviderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
  add_column :users, :uid, :string
  add_column :users, :short_description, :string
  end
end
