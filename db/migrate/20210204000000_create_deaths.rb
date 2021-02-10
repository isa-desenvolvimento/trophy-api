class CreateDeaths < ActiveRecord::Migration[6.1]
  def change
    create_table :deaths do |t|
      t.timestamp :time_reg
    end
  end
end
