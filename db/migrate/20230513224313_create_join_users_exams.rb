# frozen_string_literal: true

class CreateJoinUsersExams < ActiveRecord::Migration[7.0]
  def change
    create_table :users_exams, id: false do |t|
      t.belongs_to :user
      t.belongs_to :exam
    end
  end
end
