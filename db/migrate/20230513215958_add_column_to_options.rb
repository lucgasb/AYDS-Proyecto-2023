class AddColumnToOptions < ActiveRecord::Migration[7.0]
  def change
    add_column :options, :option1, :string
    add_column :options, :option2, :string
    add_column :options, :correcta, :string
  end
end
