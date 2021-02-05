class CreateKilledMonsters < ActiveRecord::Migration[6.1]
  def change
    create_table :killed_monsters do |t|
      t.integer :monster_id

      t.timestamps
    end
  end
end
