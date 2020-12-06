# class Vote
#   def initialize(voter, candidate)
#   end
#   def voter
#     "Miyoshi"
#   end
#   def candidate
#     "Alice"
#   end
# end

class Vote
  attr_reader :voter, :candidate #readerは、accesor+writerの読み書きできる

  def initialize(voter,candidate)
    @voter = voter
    @candidate = candidate
  end
end

