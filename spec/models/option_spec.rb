require 'sinatra/activerecord'
require_relative '../../models/init.rb'
describe 'Option' do
  describe 'valid' do
    describe 'When a question has got three options' do
      it 'Should be valid' do
        o = Option.new(option: "a", option2: "b", correct: "c")
        expect(o.valid?).to eq(true)
      end
    end
    
    describe 'When a question has got two options' do
      it 'Should be invalid' do
        o = Option.new(option: "a", option2: "b")
        expect(o.valid?).to eq(false)
      end
    end
    
    describe 'When a question has not got any options' do
      it 'Should be invalid' do
        o = Option.new
        expect(o.valid?).to eq(false)
      end
    end

    describe 'When a question has got only a option' do
      it 'Should be valid' do
        o = Option.new(correct: "c")
        expect(o.valid?).to eq(false)
      end
    end
  end
end
