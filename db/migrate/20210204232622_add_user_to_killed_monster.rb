class AddUserToKilledMonster < ActiveRecord::Migration[6.1]
  def change
    add_reference :killed_monsters, :user, foreign_key: true
    add_reference :killed_monsters, :monster, foreign_key: true
  end
end
