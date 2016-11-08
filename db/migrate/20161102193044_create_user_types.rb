class CreateUserTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_types do |t|
      t.string :title
      t.boolean :access
      t.timestamps
    end
  end
end
