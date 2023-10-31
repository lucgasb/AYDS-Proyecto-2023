# frozen_string_literal: true

class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.integer :score
      t.integer :lifes
      t.integer :time
    end
  end
end
