class Rental
    attr_accessor :date :book, :person

    def initialize(book, date, person)
        @date = date

        @person = perosn
        person.rentals << self
        
        @book = book
        book.rentals << self
    end
end