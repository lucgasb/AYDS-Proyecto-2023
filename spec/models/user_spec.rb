require_relative '../../models/init.rb'
require 'sinatra/activerecord'

describe 'User' do
  describe 'valid' do
    describe 'when there is no email' do
      it 'should be invalid' do
        u = User.new
        expect(u.valid?).to eq(false)
      end
    end
  end
end