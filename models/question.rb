class Question < ActiveRecord::Base
    belongs_to :option
    belongs_to :practice
    has_and_belongs_to_many :exams
end
