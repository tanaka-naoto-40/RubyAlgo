class UpdateUsersForDevise < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :username, :string
    remove_column :users, :crypted_password, :string
    remove_column :users, :salt, :string
    remove_column :users, :line_user_id, :string

    add_column :users, :encrypted_password, :string, default: "", null: false
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime
    add_column :users, :name, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :alarm_time, :datetime

    add_index :users, :reset_password_token, unique: true

    change_column :users, :email, :string, default: "", null: false
  end
end
