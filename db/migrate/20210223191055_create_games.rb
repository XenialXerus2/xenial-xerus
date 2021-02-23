# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
