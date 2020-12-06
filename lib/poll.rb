# class Poll    
#     def initialize(title, candidates)
#     end

#     def title
#         "Awesome Poll"
#     end
#     def candidates
#         ['Alice', 'Bob']
#     end
# end

class Poll
    class InvalidCandidateError < StandardError #StandardErrorを継承
    end

    attr_reader :title, :candidates, :votes
    def initialize(title, candidates)
      @title = title
      @candidates = candidates
      @votes = []
    end

    def add_vote(vote)
        # if vote.candidate == 'INVALID'
        unless candidates.include?(vote.candidate)
            raise InvalidCandidateError
        end

        @votes.push(vote) #配列の要素を追加
    end

    #そのまま返しているだけなので、attr_readerで代替できる
    # def votes 
    #     @votes
    # end

    def count_votes
        result = {} #hashを返す
        @candidates.each do |candidate|
            result[candidate] = 0
        end

        @votes.each do |vote|
            result[vote.candidate] += 1
        end

        # result#これでreturn result
        result.sort_by { |_key, value|value}.reverse.to_h #_keyは使わないやつ
    end


end