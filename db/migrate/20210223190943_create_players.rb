class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :last_name, null: false

      t.timestamps
    end
  end
end