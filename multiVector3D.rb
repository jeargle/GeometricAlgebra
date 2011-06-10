#
# Geometric Algebra
# MultiVector3D
#
# John Eargle
# 2010, 2011
#

include Math
require 'matrix'
require 'grade3D'


class MultiVector3D
  
  attr_reader :blade0, :blade1, :blade2, :blade3

  # Initialize
  def initialize(blade0, blade11, blade12, blade13,
		 blade21, blade22, blade23, blade3)
    @blade0 = blade0
    @blade1 = Vector[blade11,blade12,blade13]
    @blade2 = Vector[blade21,blade22,blade23]
    @blade3 = blade3
    @grade = Grade3D.new(blade0,blade11,blade12,blade13,
			 blade21,blade22,blade23,blade3)
  end

  # Multivector addition
  def +(num)
    return MultiVector3D.new(@blade0 + num.blade0,
                           @blade1[0] + num.blade1[0],
                           @blade1[1] + num.blade1[1],
                           @blade1[2] + num.blade1[2],
                           @blade2[0] + num.blade2[0],
                           @blade2[1] + num.blade2[1],
                           @blade2[2] + num.blade2[2],
                           @blade3 + num.blade3)
  end

  # Multivector subtraction
  def -(num)
    return MultiVector3D.new(@blade0 - num.blade0,
                           @blade1[0] - num.blade1[0],
                           @blade1[1] - num.blade1[1],
                           @blade1[2] - num.blade1[2],
                           @blade2[0] - num.blade2[0],
                           @blade2[1] - num.blade2[1],
                           @blade2[2] - num.blade2[2],
                           @blade3 - num.blade3)
  end

  # Dot product (inner product)
  # return 0-vector (scalar)
  # a*b = 1/2 (ab + ba)
  def dot(num)
    return MultiVector3D.new(0.5,0,0,0).geom(self.geom(num) + num.geom(self))
  end

  # Wedge product (outer product)
  # return 2-vector
  # a^b = 1/2 (ab - ba)
  def ^(num)
    blade0 = @blade0 * num.blade0
    blade1 = num.blade1 * @blade0 + @blade1 * num.blade0
    blade2 = @blade0 * num.blade2 + @blade2 * num.blade0 + (@blade1[0] * num.blade1[1]) - (@blade1[1] * num.blade1[0])
    return MultiVector3D.new(blade0,blade1[0],blade1[1],blade2)
  end

  # Geometric product
  # return a multivector
  # ab = a*b + a^b
  #       |  1    e1    e2    e3    e12    e23    e31    e123
  #----------------------------------------------------------------
  #   1   |  1    e1    e2    e3    e12    e23    e31    e123
  #  e1   | e1     1    e12  -e31   e2     e123  -e3     e23
  #  e2   | e2   -e12    1    e23  -e1     e3     e123   e31
  #  e3   | e3    e31  -e23    1    e123  -e2     e1     e12  
  #  e12  | e12  -e2    e1    e123  -1    -e31    e23   -e3
  #  e23  | e23   e123 -e3    e2    e31    -1    -e12   -e1  
  #  e31  | e13   e3    e123 -e1   -e23    e12    -1    -e2    
  #  e123 | e123  e23   e31   e12  -e3    -e1    -e2     -1
  def geom(num)
    blade0 = @blade0 * num.blade0 +
      @blade1[0] * num.blade1[0] +
      @blade1[1] * num.blade1[1] +
      @blade1[2] * num.blade1[2] -
      @blade2[0] * num.blade2[0] -
      @blade2[1] * num.blade2[1] -
      @blade2[2] * num.blade2[2] -
      @blade3 * num.blade2[1]
    blade1 = Vector[@blade0 * num.blade1[0] +
      @blade1[0] * num.blade0 -
      @blade1[1] * num.blade2[0] +
      @blade1[2] * num.blade2[2] +
      @blade2[0] * num.blade1[1] -
      @blade2[1] * num.blade3 -
      @blade2[2] * num.blade1[1] -
      @blade3 * num.blade[2][1],
      @blade0 * num.blade1[1] +
      @blade1[0] * num.blade2[0] +
      @blade1[1] * num.blade0 -
      @blade1[2] * num.blade2[1] -
      @blade2[0] * num.blade1[0] +
      @blade2[1] * num.blade1[2] -
      @blade2[2] * num.blade3 -
      @blade3 * num.blade2[2],
      @blade0 * num.blade1[2] -
      @blade1[0] * num.blade2[2] +
      @blade1[1] * num.blade2[1] +
      @blade1[2] * num.blade0 -
      @blade2[0] * num.blade3 -
      @blade2[1] * num.blade1[1] +
      @blade2[2] * num.blade1[0] -
      @blade3 * num.blade2[0]]
    blade2 = Vector[@blade0 * num.blade2[0] +
      @blade1[0] * num.blade1[1] -
      @blade1[1] * num.blade1[0] +
      @blade1[2] * num.blade3 +
      @blade2[0] * num.blade0 -
      @blade2[1] * num.blade2[2] +
      @blade2[2] * num.blade0[1] +
      @blade3 * num.blade1[2],
      @blade0 * num.blade2[1] +
      @blade1[0] * num.blade3 +
      @blade1[1] * num.blade1[2] -
      @blade1[2] * num.blade1[1] +
      @blade2[0] * num.blade2[2] +
      @blade2[1] * num.blade0 -
      @blade2[2] * num.blade2[0] +
      @blade3 * num.blade1[0],
      @blade0 * num.blade2[2] -
      @blade1[0] * num.blade1[2] -
      @blade1[1] * num.blade3 +
      @blade1[2] * num.blade1[0] -
      @blade2[0] * num.blade2[1] +
      @blade2[1] * num.blade2[0] +
      @blade2[2] * num.blade0 +
      @blade3 * num.blade1[1]]
    blade3 = @blade0 * num.blade3 +
      @blade1[0] * num.blade2[1] +
      @blade1[1] * num.blade2[2] +
      @blade1[2] * num.blade2[0] +
      @blade2[0] * num.blade1[2] +
      @blade2[1] * num.blade1[0] +
      @blade2[2] * num.blade1[1] +
      @blade3 * num.blade0

    return MultiVector3D.new(blade0,blade1[0],blade1[1],blade1[2],
			     blade2[0],blade2[1],blade2[2],blade3)
  end

  # Rotate multivector by given angle
  def rotate(angle)
    
  end

  # Return the multivector's grade
  def grade()
    return @grade.to_s
  end

  # Whether the multivector has a given grade
  def isGrade?(grade)
    return @grade.isGrade?(grade)
  end

  # Whether the multivector is a true multivector
  def multivector?
    return @grade.multivector?
  end

  # String version of the multivector
  def to_s()
    if @grade.isGrade?(0)
      return "#{@blade0}"
    elsif @grade.isGrade?(1)
      return "(#{@blade1[0]}e1 + #{@blade1[1]}e2 + #{@blade1[2]}e3)"
    elsif @grade.isGrade?(2)
      return "(#{@blade2[0]}e12 + #{@blade2[1]}e23 + #{@blade2[2]}e31)"
    elsif @grade.isGrade?(3)
      return "#{@blade3}e123"
    end
    return "#{@blade0} + (#{@blade1[0]}e1 + #{@blade1[1]}e2 + #{@blade1[2]}e3) + " +
      "(#{@blade2[0]}e12 + #{@blade2[1]}e23 + #{@blade2[2]}e31) + #{@blade3}e123"
  end

end


