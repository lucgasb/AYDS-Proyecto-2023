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
        if score == 0
            return 0
        else    
            return score - 5
        end    
    end 
    def restaVida
        return life - 1
    end
end