class CreateInfoCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :info_coins do |t|
      t.integer :sum
    end
  end
end
