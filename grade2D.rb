#
# Geometric Algebra
#
# John Eargle
# 2010, 2011

include Math
require "matrix"


class Grade2D

  # Initialize
  def initialize(blade0, blade11, blade12, blade2)
    @grade = [false, false, false]
    if (blade0 != 0)
      @grade[0] = true
    end
    if (blade11 != 0 || blade12 != 0)
      @grade[1] = true
    end
    if (blade2 != 0)
      @grade[2] = true
    end
  end

  # 
  def isGrade?(grade)
    if grade==0 && @grade[0] && !(@grade[1] || @grade[2])
      return true
    elsif grade==1 && @grade[1] && !(@grade[0] || @grade[2])
      return true
    elsif grade==2 && @grade[2] && !(@grade[0] || @grade[1])
      return true
    end
    return false
  end

  # 
  def multivector?()
    if (@grade[0] && @grade[1]) ||
        (@grade[0] && @grade[2]) ||
        (@grade[1] && @grade[2])
      return true
    end
    return false
  end

  # 
  def to_s()
    if (@grade[0] && @grade[1]) ||
        (@grade[0] && @grade[2]) ||
        (@grade[1] && @grade[2])
      return "multiVector"
    elsif (@grade[1])
      return "1"
    elsif (@grade[2])
      return "2"
    end
    return "0"
  end

end