require_relative '../lib/poll' #pollを読み込み

RSpec.describe Poll do #頭文字が大文字なら定数、小文字なら変数
    it 'has a title and candidates' do
        poll = Poll.new('Awesome Poll', ['Alice', 'Bob'])

        expect(poll.title).to eq 'Awesome Poll'
        expect(poll.candidates).to eq ['Alice', 'Bob']#[]の中は、 %w[Alice Bob] でも可
    end
end
