# frozen_string_literal: true

class AddAnotherColumnToExams < ActiveRecord::Migration[7.0]
  def change
    add_column :exams, :points_streak, :integer
  end
end
