require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe 'IMDB Quiz' do
  describe 'Homepage' do
    it 'Asks user for a word to show him movies containing that same word' do
      get '/'
      expect(last_response).to be_ok
    end
  end
end
