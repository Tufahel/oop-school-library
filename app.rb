require_relative './person'
require_relative './teacher'
require_relative './student'
require_relative './classroom'
require_relative './book'
require_relative './rental'
require_relative './start_app'

class App < StartApp
  def initialize
    super()
    @books = []
    @persons = []
    @rentals = []
  end

  def list_all_books
    puts 'Database is empty! Add a book.' if @books.empty?
    @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_persons
    puts 'Database is empty! Add a person.' if @persons.empty?
    @persons.each { |person| puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, Id: #{person.id}" }
  end

  def create_person
    print 'To create a student, press 1, to create a teacher, press 2 : '
    option = gets.chomp
    option_type = ' '

    case option
    when '1'
      option_type = 'student'
    when '2'
      option_type = 'teacher'
    end

    create_common_input(option_type, option)
  end

  def create_common_input(option_type, option)
    puts "Create a new #{option_type}"
    print "Enter #{option_type} age: "
    age = gets.chomp.to_i
    print "Enter #{option_type} name: "
    name = gets.chomp

    case option
    when '1'
      create_student(age, name)
    when '2'
      create_teacher(age, name)
    else
      puts 'Invalid input, Try again'
    end
  end

  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      student = Student.new('classroom', age, name, parent_permission: false)
      @persons << student
      puts 'Student doesnt have parent permission, cant rent books'
    when 'y'
      student = Student.new('classroom', age, name, parent_permission: true)
      @persons << student
      puts 'Student created successfully'
    end
  end

  def create_teacher(age, name)
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @persons << teacher
    puts 'Teacher created successfully'
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

  def create_rental
    puts 'Select which book you want to rent by entering its number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_id = gets.chomp.to_i

    puts 'Select a person from the list by its number'
    @persons.each_with_index { |person, index| puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}" }
    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @books[book_id], @persons[person_id])
    @rentals << rental

    puts 'Rental created successfully'
  end

  def list_all_rentals
    print 'To see person rentals enter the person ID: '
    id = gets.chomp.to_i
    puts 'Rented Books:'
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Person: #{rental.person.name} Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
      else
        puts
        puts 'No records where found for the given ID'
      end
    end
  end
end
