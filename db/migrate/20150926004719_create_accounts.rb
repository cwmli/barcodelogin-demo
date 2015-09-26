class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :studentnumber
      t.string :password
      t.datetime :lastlogin
      t.integer :loggedin

      t.string :password_digest

      t.timestamps null: false
    end
  end
end
