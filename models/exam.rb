class Exam < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_and_belongs_to_many :questions

    validates :score, numericality: { greater_than_or_equal_to: 0 }
end