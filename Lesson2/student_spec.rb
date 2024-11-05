require 'minitest/autorun'
require 'minitest/spec'
require_relative 'student'
require_relative 'test_helper'

describe Student do
  let(:student) { Student.new("Hlukhanko", "Evgenia", Date.new(2006, 01, 05)) }

  describe "#calculate_age" do
    it "returns the correct age" do
      expected_age = Date.today.year - 2006
      expect(student.calculate_age).must_equal expected_age
    end
  end

  describe "#get_students_by_name" do
    it "returns students with the specified first name" do
      student1 = Student.new("Hlukhanko", "Evgenia", Date.new(2006, 01, 05))
      student2 = Student.new("Smith", "Evgenia", Date.new(2006, 01, 05))
      expected_array = [student1, student2]

      expect(Student.get_students_by_name("Evgenia")).must_equal expected_array
    end
  end

  describe "#date_of_birth_validation" do
    it "raises an error for invalid date of birth" do
      expect { Student.new("Hlukhanko", "Evgenia", Date.today) }.must_raise ArgumentError
    end
  end
end
