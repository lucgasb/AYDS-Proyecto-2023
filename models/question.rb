class Question < ActiveRecord::Base
    belongs_to :option
    belongs_to :practice
end
