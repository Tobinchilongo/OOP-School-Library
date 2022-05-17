require './app'

def ask_user(ask)
  print "#{ask}: "
  gets.chomp
end

def ask_user_i(ask)
  print "#{ask}: "
  gets.to_i
end

def ask_user?(ask)
  print "#{ask}? [Y, N]: "
  input = gets.chomp.downcase
  if input.start_with?('y')
    true
  elsif input.start_with?('n')
    false
  end
end

def person_success
  puts 'Person created successfully'
end

def list_people(people)
  people.each_with_index do |person, idx|
    puts "#{idx}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
end

def list_books(books)
  books.each_with_index do |book, idx|
    puts "#{idx}) Title: #{book.title}, Author: #{book.author}"
  end
end

def create_person(app)
  person_selection = ask_user_i('Do you want to create a student (1) or a teacher (2)? Input the number')
  age = ask_user('Age')
  name = ask_user('Name')

  case person_selection
  when 1
    permission = ask_user?('Has parent permission')
    app.create_student(age, name, permission)
    person_success
  when 2
    specialization = ask_user('Specialization')
    app.create_teacher(age, name, specialization)
    person_success
  else
    puts 'Please select either 1 or 2.'
  end
end

def create_book(app)
  title = ask_user('Enter title')
  author = ask_user('Enter author')
  app.create_book(title, author)
  puts 'Book created successfully'
end

def create_rental(app)
  puts "\n Select a book from the following list by number"
  list_books(app.books)
  selected_book_idx = gets.to_i

  puts "\n Select a person from the following list by number (not id)"
  list_people(app.people)
  selected_person_idx = gets.to_i

  app.create_rental(app.books[selected_book_idx], app.people[selected_person_idx])
  puts 'Rental created successfully'
end

def list_rentals(app)
  id_to_query = ask_user_i('ID of person')
  puts 'Rentals: '
  rentals = app.list_rentals_for_given_id(id_to_query)
  rentals.each { |rental| puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" }
end
