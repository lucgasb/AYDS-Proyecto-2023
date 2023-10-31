# frozen_string_literal: true

class AddColumnToExams < ActiveRecord::Migration[7.0]
  def change
    add_column :exams, :answered_questions, :integer, array: true, default: [2]
  end
end
