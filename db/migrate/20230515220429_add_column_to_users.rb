# frozen_string_literal: true

class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :total_score, :integer, default: 0
    add_column :users, :username, :string
  end
end
