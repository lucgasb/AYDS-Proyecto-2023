class RemoveColumnFromOptions < ActiveRecord::Migration[7.0]
  def change
    remove_column :options, :option1
  end
end
