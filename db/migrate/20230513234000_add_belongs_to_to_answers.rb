class AddBelongsToToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :answers, :user
    add_belongs_to :answers, :exam
  end
end
