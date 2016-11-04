class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.string :code
      t.integer :state
      t.integer :fragility
      t.integer :size
      t.float :weight
      t.float :value
      t.integer :conveyance
      t.date :shipping_date
      t.date :delivery_date
      t.text :observations
      t.references :user, foreign_key: true
      t.references :receiver, foreign_key: true
      t.references :container, foreign_key: true

      t.timestamps
    end
  end
end
