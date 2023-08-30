class Exam < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_and_belongs_to_many :questions

    validates :score, numericality: { greater_than_or_equal_to: 0 }
    def isValid
        if life == 0 
            @valid = false
        else 
            @valid = true
        end
        return @valid
    end
    def sumaPuntos
        @puntos = score
        @puntos += 10
        return @puntos
    end
    def restaPuntos
        @puntos = score
        @puntos -= 5
        return @puntos
    end 
    def restaVida
        @vida = life
        @vida -= 1
        return @vida
    end
end