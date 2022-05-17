require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, classroom = [])
    super(age, name)
    @classroom = classroom
  end

  def add_classroom(classroom)
    @classroom.push(classroom) unless @classroom.include?(classroom)
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
