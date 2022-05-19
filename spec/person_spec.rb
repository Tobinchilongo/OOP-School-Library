require_relative '../classes/person'

describe Person do
  context 'Test for the Person class' do
    age = 20
    name = 'Jerry'
    person = Person.new(age, name, parent_permission: false)
    it 'if it is right class name' do
      expect(person.class.name) == Person
    end
    it 'if it has right name, age and permission' do
      expect(person.age).to eq 20
      expect(person.name).to eq 'Jerry'
    end
  end
end
