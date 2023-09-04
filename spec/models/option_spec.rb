require_relative '../../models/init.rb'
require 'sinatra/activerecord'

describe 'Exam' do
  describe 'valid' do
    describe 'When a question has got three options' do
      it 'Should be valid' do
        q = Question.new(question: "Is this test correct?")
        o = Option.new(option: "a", option2: "b", correct: "c", question: q)
        expect(o.valid?).to eq(true)
      end
    end
    
    describe 'When a question has got two options' do
      it 'Should be invalid' do
        q = Question.new(question: "Why it have only two options?")
        o = Option.new(option: "a", option2: "b", question: q)
        expect(o.valid?).to eq(false)
      end
    end
    
    describe 'When a question has not got any options' do
      it 'Should be invalid' do
        q = Question.new(question: "Why it dont have options?")
        o = Option.new(question: q)
        expect(o.valid?).to eq(false)
      end
    end

    describe 'When a question has got only a option' do
      it 'Should be valid' do
        q = Question.new(question: "The only option is the correct?")
        o = Option.new(correct: "c", question: q)
        expect(o.valid?).to eq(false)
      end
    end

  end
end
