require 'minitest/autorun'
require 'minitest/reporters'
require 'date'
require_relative 'student'

Minitest::Reporters.use!(Minitest::Reporters::HtmlReporter.new) unless ENV['RM_INFO']

class StudentTest < Minitest::Test
  def setup
    @student1 = Student.new("Hlukhanko", "Evgenia", "2006-01-05")
    @student2 = Student.new("Smith", "Evgen", "2006-01-05")
    @student3 = Student.new("Hlu", "Evgenia", "2004-12-12")
  end

  def test_calculate_age
    assert_equal 18, @student1.calculate_age, "Age must be 18!"
  end

  def test_raising_error
    assert_raises ArgumentError do
      Student.new("Hlukhanko", "Evgenia", (Date.today + 1).to_s)
    end
  end

  def test_get_students_by_age
    expected_students_names = [@student1.name, @student2.name]
    actual_students = Student.get_students_by_age(18)

    actual_students_names = actual_students.map { |student| student.name }
    assert_equal expected_students_names, actual_students_names
  end
end
