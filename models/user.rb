class User < ActiveRecord::Base
    has_and_belongs_to_many :exams

    validates :email, presence: true
end
