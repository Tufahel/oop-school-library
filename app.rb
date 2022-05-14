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

    def list_all_books
        puts 'Database is empty! Add a book.' if @books.empty?
        @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}"}
    end

    def list_all_persons
        puts 'Database is empty! Add a person.' if @persons.empty?
        @persons.each { |person| puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, Id: #{person.id}"}
    end

    def create_person
        print 'To create a student, press 1, to create a teacher, press 2 :'
        option = gets.chomp

        case option
        when '1'
            create_student
        when '2'
            create_teacher
        else
            puts 'Invalid input, Try again'
        end
    end

    def create_student
        puts 'Create a new student'
        print 'Enter student age: '
        age = gets.chomp.to_i
        print 'Enter name: '
        name = gets.chomp
        print 'Has parent permission? [Y/N]'
        parent_permission = gets.chomp.downcase
        case parent_permission
        when 'n'
            Student.new('classroom', age, name, parent_permission: false)
            @person << student
            puts 'Student doesnt have parent permission, cant rent books'
        when 'y'
            student = Student.new('classroom', age, name, parent_permission: true)
            @person << student
            puts 'Student created successfully'
        end
    end

    def create_book()
        puts 'Create a new book'
        print 'Enter title: '
        title = gets.chomp
        print 'Enter author: '
        author = gets
        book = Book.new(title, author)
        @books.push(book)
        puts "Book #{title} created successfully."
    end
end