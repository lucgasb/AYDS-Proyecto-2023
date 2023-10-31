# frozen_string_literal: true

class CreatePractices < ActiveRecord::Migration[7.0]
  def change
    create_table :practices do |t|
      t.string :theoric
      t.string :category
    end
  end
end
