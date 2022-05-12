class Nameable
    attr_accessor :nameable

    def correct_name
        raise NotImplementError
    end
end