# frozen_string_literal: true

class ChangeOtherTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :users_exams, :exams_users
  end
end
