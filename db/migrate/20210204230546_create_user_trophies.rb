class CreateUserTrophies < ActiveRecord::Migration[6.1]
  def change
    create_table :user_trophies do |t|
      t.integer :trophy_id

      t.timestamps
    end
  end
end
