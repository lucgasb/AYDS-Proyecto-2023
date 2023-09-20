class Visited < ActiveRecord::Base
    belongs_to :exams

    def correct 
      if idq
        if exam_id
          return true
        else
          return false
        end 
      else
        return false
      end
    end      
end
