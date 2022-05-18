require_relative '../book'
require_relative '../student'
require_relative '../rental'

describe Rental do
  context 'test for Rental class' do
    # date = '2022-04-12'
    book = Book.new('My love for you', 'Esther Owusu')
    person = Student.new(35, 'Jerry', parent_permission: true)
    rental = Rental.new(book, person)

    it 'if it is instance of class' do
      expect(rental).to be_an_instance_of(Rental)
    end

    it 'if it is book' do
      expect(rental.book).to eql(book)
    end

    it 'if it is person' do
      expect(rental.person).to eql(person)
    end

    it 'if it is correct name of renter' do
      expect(rental.person.name) == 'Jerry'
    end

    it 'if it is correct title of rented book' do
      expect(rental.book.title) == 'My love for you'
    end
  end
end