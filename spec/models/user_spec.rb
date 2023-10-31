# frozen_string_literal: true

require 'sinatra/activerecord'
require_relative '../../models/init.rb'
describe 'User' do
  describe 'valid' do
    describe 'when there is not email' do
      it 'should be invalid' do
        u = User.new
        expect(u.valid?).to eq(false)
      end
    end

    describe 'when there is not username' do
      it 'should be invalid' do
        u = User.new(email: 'maria@example.com')
        expect(u.valid?).to eq(false)
      end
    end

    describe 'when the password is too short' do
      it 'should be invalid' do
        u = User.new(username: 'juancito', email: 'juan@example.com', password: '1234')
        expect(u.valid?).to eq(false)
      end
    end

    describe 'when the username is too short' do
      it 'should be invalid' do
        u = User.new(username: 'ab', email: 'juan@example.com')
        expect(u.valid?).to eq(false)
      end
    end

    describe 'when the email domain is invalid' do
      it 'should be invalid' do
        u = User.new(username: 'luis_cabral', email: 'luisito@example')
        expect(u.valid?).to eq(false)
      end
    end

    describe 'when the email has not got a @' do
      it 'should be invalid' do
        u = User.new(username: 'luis_cabral', email: 'bali', password: 'password')
        expect(u.valid?).to eq(false)
      end
    end

    describe 'when there is not a password' do
      it 'should be invalid' do
        u = User.new(username: 'luis_cabral', email: 'luisito@example.com')
        expect(u.valid?).to eq(false)
      end
    end
    describe 'when all the attributes are valid' do
      it 'should be valid' do
        u = User.new(username: 'luis_cabral', email: 'luisito@example.com', password: 'password')
        expect(u.valid?).to eq(true)
      end
    end
  end
end
