class Exam < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_and_belongs_to_many :questions
    has_many :visiteds
    validates :score, numericality: { greater_than_or_equal_to: 0 }

    attribute :points_streak, :integer, default: 0

    def isValid
        return life > 0
    end
    def sumaPuntos
        if estaEnRacha
            return score + 20
        else
            return score + 10
        end
        
    end
    def restaPuntos
        if score == 0
            return 0
        else    
            return score - 5
        end    
    end 
    def restaVida
        return life - 1
    end
    def estaEnRacha
        return points_streak >= 5
    end
end