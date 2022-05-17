require './person'
require './student'
require './teacher'
require './book'
require './classroom'
require './rental'
require './nameable'

class App
  attr_reader :books, :people

  def initialize
    @books = []
    @people = []
  end

  def create_student(age, name, permission)
    new_person = Student.new(age, name, permission)
    @people.push(new_person)
  end

  def create_teacher(age, name, specialization)
    new_person = Teacher.new(age, name, specialization)
    @people.push(new_person)
  end

  def create_book(title, author)
    new_book = Book.new(title, author)
    @books.push(new_book)
  end

  def create_rental(book, person)
    Rental.new(book, person)
  end

  def list_rentals_for_given_id(id)
    selected_person = @people.select { |person| person.id == id }
    selected_person[0].rentals
  end
end
