require_relative '../student'
require_relative '../classroom'

describe Student do
  context 'Test for the Student class' do
    age = 24
    name = 'Jerry'
    classroom = 'web developer'
    student1 = Student.new(age, name, classroom)
    it 'if is an istance of class' do
      expect(student1).to be_an_instance_of(Student)
    end
    it 'if it is correct, age, name, parrent_permission and classroom' do
      expect(student1.name).to eql('Jerry')
      expect(student1.age).to eql(24)
      expect(student1.classroom).to eql('web developer')
    end
    it 'if it plays hooky ¯\(ツ)/¯' do
      expect(student1.play_hooky).to eql("¯\(ツ)/¯")
    end
  end
end
