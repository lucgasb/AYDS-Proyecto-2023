# frozen_string_literal: true

require 'sinatra/activerecord'
require_relative '../../models/init.rb'
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
        expect(Exam.valid(e)).to eq(false)
      end
    end
    describe 'when the life is greater than 0' do
      it 'the exam should be valid' do
        e = Exam.new
        e.life = 2
        expect(e.valid?).to eq(true)
      end
    end

    describe 'when the answer is correct' do
      it 'the score should be plus 10' do
        e = Exam.new
        e.score = 10
        e.save
        expect(e.suma_puntos).to eq(20)
      end
    end

    describe 'when the answer is wrong' do
      it 'the score should be minus 5' do
        e = Exam.new
        e.score = 10
        e.save
        expect(e.resta_puntos).to eq(5)
      end
    end

    describe 'when the answer is wrong' do
      it 'the life should be minus 1' do
        e = Exam.new
        e.life = 3
        e.save
        i = e.resta_vida
        expect(i).to eq(2)
      end
    end
    describe 'when the first answer is correct but the second answer is wrong' do
      it 'the score should be 5' do
        e = Exam.new
        e.score = e.suma_puntos
        e.score = e.resta_puntos
        expect(e.score).to eq(5)
      end
    end
    describe 'when the first answer is correct but the second answer is wrong' do
      it 'the life should be 2' do
        e = Exam.new
        e.life = e.resta_vida
        expect(e.life).to eq(2)
      end
    end
    describe 'when the first answer is wrong but the second answer is correct' do
      it 'the score should be 10' do
        e = Exam.new
        e.score = e.resta_puntos
        e.score = e.suma_puntos
        expect(e.score).to eq(10)
      end
    end

    describe 'when the user answer correctly five questions' do
      it 'should be in streak' do
        e = Exam.new
        e.points_streak = 5
        expect(e.esta_en_racha).to eq(true)
      end
    end
    describe 'when the user answer correctly five questions' do
      it 'should be in streak and plus 20 points to the score' do
        e = Exam.new
        e.points_streak = 5
        e.score = e.suma_puntos
        expect(e.score).to eq(20)
      end
    end
    describe 'when the user answer correctly three questions' do
      it 'should not be in streak' do
        e = Exam.new
        e.points_streak = 3
        expect(e.esta_en_racha).to eq(false)
      end
    end
    describe 'when the user answer correctly three questions' do
      it 'should not be in streak and only plus 10 points to the score' do
        e = Exam.new
        e.points_streak = 3
        e.score = e.suma_puntos
        expect(e.score).to eq(10)
      end
    end
  end
end
