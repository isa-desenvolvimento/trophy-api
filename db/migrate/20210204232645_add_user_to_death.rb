class AddUserToDeath < ActiveRecord::Migration[6.1]
  def change
    add_reference :deaths, :user, foreign_key: true
  end
end
