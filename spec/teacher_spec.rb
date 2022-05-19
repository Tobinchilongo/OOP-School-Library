require_relative '../classes/teacher'

describe Teacher do
  context 'Test for the Teacher class' do
    age = 30
    name = 'Jerry'
    specialization = 'Programming'
    teacher = Teacher.new(age, specialization, name)
    it 'if is instance of class' do
      expect(teacher.instance_of?(Teacher)) == true
    end
    it 'if there are right age, name and specialization' do
      expect(teacher.age).to eq 30
      expect(teacher.name).to eq 'Jerry'
    end
    it 'if can rent a book' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
