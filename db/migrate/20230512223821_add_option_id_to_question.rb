class AddOptionIdToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :question, :option_id, :integer
    add_index :question, :option_id, unique: true
  end
end
