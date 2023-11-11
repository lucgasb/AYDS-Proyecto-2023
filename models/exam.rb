# frozen_string_literal: true

class Exam < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :questions
  has_many :visiteds
  validates :score, numericality: { greater_than_or_equal_to: 0 }

  attribute :points_streak, :integer, default: 0

  def self.valid(examen)
    examen.life > 0
  end

  def suma_puntos
    if esta_en_racha
      score + 20
    else
      score + 10
    end
  end

  def resta_puntos
    if score.zero?
      0
    else
      score - 5
    end
  end

  def resta_vida
    life - 1
  end

  def esta_en_racha
    points_streak >= 5
  end
end
