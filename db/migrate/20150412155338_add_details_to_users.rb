class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :date
    add_column :users, :user_description, :textarea
    add_column :users, :website, :text
    add_column :users, :commitment, :string
    add_column :users, :is_female, :boolean, default: false
  end
end
