require 'date'

class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person)
    @date = DateTime.now
    @book = book
    @person = person
    book&.add_rental(self)
    person&.add_rental(self)
  end

  def create_object
    { book_title: @book.title, person_id: @person.id, date: @date }
  end
end
