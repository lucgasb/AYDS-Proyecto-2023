class DeleteThemes < ActiveRecord::Migration[7.0]
  def change
    drop_table :themes
  end
end
