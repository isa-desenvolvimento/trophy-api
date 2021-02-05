class AddUserToCollectedCoin < ActiveRecord::Migration[6.1]
  def change
    add_reference :collected_coins, :user, foreign_key: true
  end
end
