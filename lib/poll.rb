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
    attr_reader :title, :candidates
  
    def initialize(title, candidates)
      @title = title
      @candidates = candidates
    end
  end