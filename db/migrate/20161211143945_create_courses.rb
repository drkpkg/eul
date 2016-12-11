class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.jsonb :route

      t.timestamps
    end
  end
end
