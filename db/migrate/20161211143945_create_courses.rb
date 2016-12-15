class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.jsonb :route
      t.boolean :express, default: false
      t.timestamps
    end
  end
end
