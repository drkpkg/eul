class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.string :code
      t.integer :state, default: 0
      t.boolean :fragility, default: false
      t.boolean :express, default: false
      t.string :size
      t.float :weight
      t.float :value
      t.integer :conveyance
      t.date :shipping_date
      t.date :delivery_date
      t.text :observations
      t.string :location
      t.references :user, on_delete: :cascade
      t.references :receiver, on_delete: :cascade
      t.references :container, default: 0, on_delete: :cascade

      t.timestamps
    end
  end
end
