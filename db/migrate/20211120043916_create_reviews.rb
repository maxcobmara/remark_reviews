class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :reviewer, null: false, foreign_key: true
      t.integer :stars
      t.string :review

      t.timestamps
    end
  end
end
