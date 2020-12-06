require_relative '../lib/poll' #pollを読み込み

RSpec.describe Poll do #頭文字が大文字なら定数、小文字なら変数
    it 'has a title and candidates' do
        poll = Poll.new('Awesome Poll', ['Alice', 'Bob'])

        expect(poll.title).to eq 'Awesome Poll'
        expect(poll.candidates).to eq ['Alice', 'Bob']#[]の中は、 %w[Alice Bob] でも可
    end

    describe '#add_vote' do
        it 'saves the given vote' do
            poll = Poll.new('Awesome Poll', ['Alice', 'Bob'])
            vote = Vote.new('Miyoshi', 'Alice')

            poll.add_vote(vote)

            # expect(poll.votes).to eq [vote] #eqは==のテスト includeもある（matchers)
            expect(poll.votes).to include vote
        end
        
        context 'with a vote that has an invalid candidate' do
            it 'raises InvalidCandidateError' do
                poll = Poll.new('Awesome Poll', ['Alice', 'Bob'])
                vote = Vote.new('Miyoshi', 'INVALID')

                expect {poll.add_vote(vote)}.to raise_error Poll::InvalidCandidateError
            end
        end
    end

    describe '#count_votes' do
        it 'counts the votes and sorts the candidates by the number of votes' do
            poll = Poll.new('Awesome Poll', %w[Alice Bob])
            poll.add_vote(Vote.new('Carol', 'Alice'))
            poll.add_vote(Vote.new('Dave', 'Alice'))
            poll.add_vote(Vote.new('Ellen', 'Bob'))

            result = poll.count_votes

            expect(result['Alice']).to eq 2 #2票入ってる
            expect(result['Bob']).to eq 1
            expect(result.keys).to eq %w[Alice Bob] #得票数が多い順に並んでることを期待してます
        
            poll2 = Poll.new('Great Poll', ['Alice', 'Bob'])
            poll2.add_vote(Vote.new('Carol', 'Bob'))
            poll2.add_vote(Vote.new('Dave', 'Bob'))
            result2 = poll2.count_votes
            expect(result2['Alice']).to eq 0
            expect(result2['Bob']).to eq 2
            expect(result2.keys).to eq ['Bob', 'Alice']
            
        end
    end
end
