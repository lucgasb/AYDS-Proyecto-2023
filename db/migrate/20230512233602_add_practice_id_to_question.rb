class AddPracticeIdToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :practice_id, :integer
    add_index :questions, :practice_id, unique: true
  end
end
