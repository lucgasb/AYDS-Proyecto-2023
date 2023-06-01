class RenameLifesAndSetDefaultsInExams < ActiveRecord::Migration[7.0]
  def change
    rename_column :exams, :lifes, :life
    change_column_default :exams, :score, 0
    change_column_default :exams, :life, 3
    change_column_default :exams, :time, 30
  end
end
