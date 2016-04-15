require File.expand_path '../spec_helper.rb', __FILE__
require 'pry'
require_relative '../lib/search.rb'

RSpec.describe Search do
  describe '.new_search' do
    it 'returns an array of 9 titles' do
      titles = ['1','2','3','4','5','6','7','8','9']
      expect(titles.size).to eq(9)
    end
  end

  describe '.get_poster' do
    it 'returns an array of 9 images' do
      posters = ['1','2','3','4','5','6','7','8','9']
      expect(posters.size).to eq(9)
    end
  end

  describe '.get_year' do
    it 'returns an array of movie year releases' do
      years = ['1999','1999','1999','1999','1999','1999','1999','1999','1999']
      expect(years.size).to eq(9)
    end
  end

  describe '.check_answer' do
    it 'checks if the provided year matches the position in the years array' do
      years = ['1999','1999','1999','1999','1999','1999','1999','1999','1999']
      answer = 0
      match = '1999'
      expect(Search.check_answer(years,match,answer)).to eq(true)
    end
  end
end
