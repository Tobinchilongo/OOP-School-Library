require './classes/book'
require './classes/person'
require './classes/student'
require './classes/teacher'
require './classes/nameable'
require './classes/classroom'
require './classes/rental'
require './classes/handle_data'

class App
  attr_reader :books, :people

  def initialize
    @books_file = HandleData.new('books')
    @people_file = HandleData.new('persons')
    @rentals_file = HandleData.new('rentals')
    @books = @books_file.read.map { |arr| Book.new(arr['title'], arr['author']) }
    @people = @people_file.read.map do |arr|
      if arr['class'].include?('Student')
        Student.new(arr['age'], arr['name'], arr['parent_permission'], arr['classroom'])
      else
        Teacher.new(arr['age'], arr['name'], arr['specialization'])
      end
    end
    @rentals = @rentals_file.read.map do |arr|
      book = @books.select { |bk| bk.title == arr['book_title'] }[0]
      person = @people.select { |pers| pers.id == arr['person_id'] }[0]
      Rental.new(book, person, arr['date'])
    end
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
    rental = Rental.new(book, person)
    @rentals.push(rental)
  end

  def list_rentals_for_given_id(id)
    selected_person = @people.select { |person| person.id == id }
    selected_person[0].rentals
  end

  def exit
    @books_file.write(@books.map(&:create_object))
    @people_file.write(@people.map(&:create_object))
    @rentals_file.write(@rentals.map(&:create_object))
  end
end
