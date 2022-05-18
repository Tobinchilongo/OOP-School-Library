require_relative '../book'

describe Book do
  context 'Test for Book class' do
    before(:context) do
      title = 'My love for you'
      author = 'Esther Owusu'
      @book = Book.new(title, author)
    end

    it 'if it is instance of a class' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'if book title is My love for you' do
      expect(@book.title).to eq('My love for you')
    end

    it 'if book author is Esther Owusu' do
      expect(@book.author).to eq('Esther Owusu')
    end
  end
end
