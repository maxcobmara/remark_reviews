class CreateFilmLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :film_locations do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :studio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
