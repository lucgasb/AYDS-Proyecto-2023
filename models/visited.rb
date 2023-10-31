# frozen_string_literal: true

class Visited < ActiveRecord::Base
  belongs_to :exams

  def correct
    if idq
      if exam_id
        true
      else
        false
      end
    else
      false
    end
  end
end
