class AddInfosToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :info_coins, :user, foreign_key: true
    add_reference :info_deaths, :user, foreign_key: true
    add_reference :info_monsters, :user, foreign_key: true
  end
end
