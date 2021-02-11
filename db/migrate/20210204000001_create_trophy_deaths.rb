class CreateTrophyDeaths < ActiveRecord::Migration[6.1]
  def change
    create_table :trophy_deaths do |t|
      t.string :name
      t.integer :punctuation

    end
  end
end
