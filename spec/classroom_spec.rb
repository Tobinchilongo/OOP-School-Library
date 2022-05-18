require_relative '../classroom'

describe Classroom do
  context 'Test for Classroom class' do
    classroom = Classroom.new('Programming')

    it 'if there is right label' do
      expect(classroom.label) == 'Programming'
    end

    it 'if there is no students' do
      expect(classroom.students.size) == 0
    end
  end
end