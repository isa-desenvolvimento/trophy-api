class AddUserToUserTrophy < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_trophies, :user, foreign_key: true
  end
end
