# frozen_string_literal: true

class AddOtherColumnToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :theme, :integer
  end
end
