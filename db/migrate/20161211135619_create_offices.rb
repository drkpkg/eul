class CreateOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :offices do |t|
      t.string :lat
      t.string :lon
      t.string :description

      t.timestamps
    end
  end
end
