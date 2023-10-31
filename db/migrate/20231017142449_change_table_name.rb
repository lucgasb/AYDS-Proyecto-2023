# frozen_string_literal: true

class ChangeTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :questions_exams, :exams_questions
  end
end
