require_relative '../../models/init.rb'
require 'sinatra/activerecord'

describe 'Exam' do
    describe 'valid' do 
        describe 'when it creates a new exam' do
            it 'the score should be 0' do
                e = Exam.new
                expect(e.score).to eq(0)
            end
        end
 
        describe 'when the life is 0' do
            it 'the exam should be finish' do
                e = Exam.new
                e.life = 0
                expect(e.isValid).to eq(false)
            end
        end
        describe 'when the life is greater than 0' do
            it 'the exam should be valid' do
                e = Exam.new
                e.life = 2
                expect(e.isValid).to eq(true)
            end    
        end    
 
        describe 'when the answer is correct' do
            it 'the score should be plus 10' do
                e = Exam.new
                e.score = 10
                e.save
                expect(e.sumaPuntos).to eq(20)
            end
        end
        
        describe 'when the answer is wrong' do
            it 'the score should be minus 5' do
                e = Exam.new
                e.score = 10
                e.save
                expect(e.restaPuntos).to eq(5)
            end
        end
        
        describe 'when the answer is wrong' do
            it 'the life should be minus 1' do
                e = Exam.new
                e.life = 3
                e.save
                i = e.restaVida
                expect(i).to eq(2)
            end
        end    
    end
end

