class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :Name
      t.integer :Release_year
      t.string :genre
      t.string :Main_actor
      t.string :string

      t.timestamps
    end
  end
end
