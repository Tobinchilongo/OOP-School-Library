require_relative '../nameable'
require_relative '../person'

describe Nameable do
  context 'Test for Nameable class' do
    person = Person.new(30, 'jerrymandeytus')
    person.correct_name
    capitalized_person = CapitalizeDecorator.new(person)
    capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

    it 'if nameable functions are working' do
      expect(capitalized_person.correct_name).to eql('Jerrymandeytus')
      expect(capitalized_trimmed_person.correct_name).to eql('Jerrymande')
    end
  end
end
