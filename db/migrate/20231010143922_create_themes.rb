# frozen_string_literal: true

class CreateThemes < ActiveRecord::Migration[7.0]
  def change
    create_table :themes do |t|
      t.string :name
    end
  end
end
