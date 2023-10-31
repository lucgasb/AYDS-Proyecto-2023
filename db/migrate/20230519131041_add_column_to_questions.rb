# frozen_string_literal: true

class AddColumnToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :image_url, :string, default: ''
  end
end
