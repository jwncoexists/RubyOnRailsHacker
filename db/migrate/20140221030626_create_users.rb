class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,           null:false, unique: true
      t.string :token
      t.datetime :confirmed_at,  default: nil
      t.string :password_digest, null: false
      t.string :account
      t.string :name

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :confirmed_at
  end
end
