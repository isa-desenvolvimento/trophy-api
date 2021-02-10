class CreateTrophiesDeaths < ActiveRecord::Migration[6.1]
  def change
    create_table :trophies_deaths do |t|
      t.string :name
      t.integer :punctuation

    end
  end
end
