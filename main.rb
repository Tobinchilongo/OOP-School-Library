require './app'
require './logic'

def exit_app(app)
  app.exit
  puts 'Data saved, Thank you & Call Again'
  false
end

def options
  [
    '',
    'Please choose an option by entering a number:',
    '1 - List all books',
    '2 - List all people',
    '3 - Create a person',
    '4 - Create a book',
    '5 - Create a rental',
    '6 - List all rentals for a given person id',
    '7 - Save and Exit'
  ]
end

# rubocop:disable Metrics/CyclomaticComplexity

def main
  app = App.new
  puts 'Welcome to School Library App.'

  app_should_run = true
  while app_should_run
    puts options
    user_selection = gets.to_i
    case user_selection
    when 1 then list_books(app.books)
    when 2 then list_people(app.people)
    when 3 then create_person(app)
    when 4 then create_book(app)
    when 5 then create_rental(app)
    when 6 then list_rentals(app)
    when 7
      app_should_run = exit_app(app)
      break
    else puts 'Please input a number between 1 and 7'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end

main
