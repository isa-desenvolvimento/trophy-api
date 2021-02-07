class CreateCollectedCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :collected_coins do |t|
      t.integer :value_coin

    end
  end
end
