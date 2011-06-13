#
# Geometric Algebra
#
# John Eargle
# 2010, 2011

include Math
require 'matrix'


class Grade3D

  # 
  def initialize(blade0,
		 blade11, blade12, blade13,
		 blade21, blade22, blade23,
		 blade3)
    @grade = [false, false, false, false]
    if (blade0 != 0)
      @grade[0] = true
    end
    if (blade11 != 0 || blade12 != 0 || blade13 != 0)
      @grade[1] = true
    end
    if (blade21 != 0 || blade22 != 0 || blade23 != 0)
      @grade[2] = true
    end
    if blade3 != 0
      @grade[3] = true
    end
  end

  # 
  def isGrade?(grade)
    if grade==0 && @grade[0] && !(@grade[1] || @grade[2] || @grade[3])
      return true
    elsif grade==1 && @grade[1] && !(@grade[0] || @grade[2] || @grade[3])
      return true
    elsif grade==2 && @grade[2] && !(@grade[0] || @grade[1] || @grade[3])
      return true
    elsif grade==3 && @grade[3] && !(@grade[0] || @grade[1] || @grade[2])
      return true
    end
    return false
  end

  # Whether multivector only has elements of a single grade
  def homogeneous?()
    gradeSum = 0
    @grade.each do |i|
      if i then
	gradeSum += 1
      end
    end
    if gradeSum > 1
      return false
    end
    return true
  end

  # Return a string representation
  def to_s()
    if !homogeneous?
      return "multiVector"
    elsif (@grade[1])
      return "1"
    elsif (@grade[2])
      return "2"
    elsif (@grade[3])
      return "3"
    end
    return "0"
  end

end



