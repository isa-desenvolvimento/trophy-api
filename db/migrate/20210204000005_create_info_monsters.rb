class CreateInfoMonsters < ActiveRecord::Migration[6.1]
  def change
    create_table :info_monsters do |t|
      t.integer :sum
    end
  end
end
