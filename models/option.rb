# frozen_string_literal: true

class Option < ActiveRecord::Base
  has_one :question

  validates :option, presence: true
  validates :option2, presence: true
  validates :correct, presence: true
end
