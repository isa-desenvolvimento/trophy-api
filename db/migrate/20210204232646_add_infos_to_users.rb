class AddInfosToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :info_coins, :trophies, foreign_key: true
    add_reference :info_monsters , :trophies, foreign_key: true
    add_reference :info_monsters , :monsters, foreign_key: true
    add_reference :info_monsters , :users, foreign_key: true
    add_reference :info_deaths, :trophy_deaths, foreign_key: true

    add_reference :users, :info_coins, foreign_key: true
    add_reference :users, :info_deaths, foreign_key: true
  end
end
