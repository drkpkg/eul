class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :document
      t.string :phone
      t.string :email
      t.string :password_digest
      t.integer :user_type
      t.timestamps
    end
  end
end
