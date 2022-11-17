class ComputerPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal)
        play = legal[rand(0...legal.length)]
        print "Computer player (#{@mark}): plays at #{play}\n"
        play
    end

end