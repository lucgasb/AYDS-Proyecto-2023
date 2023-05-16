class AddColumnToOptions < ActiveRecord::Migration[7.0]
  def change
    add_column :options, :option2, :string
    add_column :options, :correct, :string
  end
end
