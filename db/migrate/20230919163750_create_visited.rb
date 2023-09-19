class CreateVisited < ActiveRecord::Migration[7.0]
  def change
    create_table :visiteds do |t|
      t.references :exam, foreign_key: true
      t.integer :idq
      t.timestamps
    end
  end
end
