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
                s = e.score
                expect(e.sumaPuntos).to eq(s + 10)
            end
        end
        
        describe 'when the answer is wrong' do
            it 'the score should be minus 5' do
                e = Exam.new
                s = e.score
                expect(e.restaPuntos).to eq(s - 5)
            end
        end
    end
end

