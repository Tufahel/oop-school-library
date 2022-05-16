class StartApp
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
