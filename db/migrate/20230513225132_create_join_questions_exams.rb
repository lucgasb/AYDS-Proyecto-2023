class CreateJoinQuestionsExams < ActiveRecord::Migration[7.0]
  def change
    create_table :questions_exams, id: false do |t|
      t.belongs_to :question
      t.belongs_to :exam
    end
  end
end
