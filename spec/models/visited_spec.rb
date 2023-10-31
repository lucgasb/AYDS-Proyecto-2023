# frozen_string_literal: true

require 'sinatra/activerecord'
require_relative '../../models/init.rb'

describe 'Visited' do
  describe 'When a visited is created and has not got the attribute exam_id' do
    it 'Should be invalid' do
      visit = Visited.new(idq: 4)
      bool = visit.correct
      expect(bool).to eq(false)
    end
  end
  describe 'When a visited is created and has got the attribute exam_id' do
    it 'Should be valid' do
      visit = Visited.new(idq: 4, exam_id: 5)
      bool = visit.correct
      expect(bool).to eq(true)
    end
  end
  describe 'When a visited is created and has not got any attribute' do
    it 'Should be invalid' do
      visit = Visited.new
      bool = visit.correct
      expect(bool).to eq(false)
    end
  end
end
