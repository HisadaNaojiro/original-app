class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name,:null => false
      t.string :last_name,:null => false
      t.string :email,:null => false
      t.string :password_digest,:null => false
      t.string :gender,:null => false
      t.string :birthplace
      t.string :residence
      t.datetime :birthday
      t.integer :validity, limit: 1 , :null => false,default: 1

      t.timestamps null: false
    end
  end
end
