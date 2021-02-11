class CreateInfoCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :info_coins do |t|
      t.integer :sum, default: 0
    end
  end
end
