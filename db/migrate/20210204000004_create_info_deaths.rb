class CreateInfoDeaths < ActiveRecord::Migration[6.1]
  def change
    create_table :info_deaths do |t|
      t.integer :sum, default: 0
    end
  end
end
