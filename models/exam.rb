class Exam < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_and_belongs_to_many :questions

    validates :score, numericality: { greater_than_or_equal_to: 0 }
    def isValid
        return life > 0
    end
    def sumaPuntos
        return score + 10
    end
    def restaPuntos
        return score - 5
    end 
    def restaVida
        return life - 1
    end
end