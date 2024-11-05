require 'date'

class Student
  attr_accessor :surname, :name, :date_of_birth

  @@students = []

  def initialize(surname, name, date_of_birth)
    parsed_date = Date.parse(date_of_birth)

    if parsed_date > Date.today
      raise ArgumentError.new("Date of birth must be in the past")
    end

    @name = name
    @surname = surname
    @date_of_birth = parsed_date

    add_student
  end

  def calculate_age
    today = Date.today
    age = today.year - @date_of_birth.year
    if (today.month < @date_of_birth.month) ||
      (today.month == @date_of_birth.month && today.day < @date_of_birth.day)
      age -= 1
    end

    age
  end

  def add_student
    if @@students.none? do |student|
      student.surname == @surname && student.name == @name && student.date_of_birth == @date_of_birth
    end
      @@students << self
    end
  end

  def remove_student
    @@students.delete(self)
  end

  def self.get_students_by_age(age)
    students_with_matching_age = []

    @@students.each do |student|
      student_age = student.calculate_age

      if student_age == age
        students_with_matching_age << student
      end
    end

    students_with_matching_age
  end

  def self.get_students_by_name(name)
    students_with_matching_name = []

    @@students.each do |student|

      if student.name == name
        students_with_matching_name << student
      end
    end

    students_with_matching_name
  end

  def self.all_students
    @@students
  end
end
