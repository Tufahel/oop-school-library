require_relative './person'
require_relative './teacher'
require_relative './student'
require_relative './classroom'
require_relative './book'
require_relative './rental'

class App
    def initialize
        @books = []
        @persons = []
        @rentals = []
    end

    def console_start
        puts 'Welcome to my School Library!'
        until list_of_options
            input = gets.chomp
            if input == '7'
                puts 'Thank you for using my School Library!'
                break
            end

            option input
        end
    end
end