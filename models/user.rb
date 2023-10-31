# frozen_string_literal: true

class User < ActiveRecord::Base
  has_and_belongs_to_many :exams

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 6 }
end
