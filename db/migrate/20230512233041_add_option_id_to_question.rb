class AddOptionIdToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :option_id, :integer
    add_index :questions, :option_id, unique: true
  end
end
