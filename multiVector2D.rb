#
# Geometric Algebra
# MultiVector2D
#
# John Eargle
# 2010, 2011
#

include Math
require 'matrix'
require 'grade2D'

class MultiVector2D
  
  attr_reader :blade0, :blade1, :blade2

  # Initialize
  def initialize(blade0, blade11, blade12, blade2)
    @blade0 = blade0
    @blade1 = Vector[blade11,blade12]
    @blade2 = blade2
    @grade = Grade2D.new(blade0,blade11,blade12,blade2)
  end

  # Multivector addition
  def +(num)
    return MultiVector2D.new(@blade0 + num.blade0,
                           @blade1[0] + num.blade1[0],
                           @blade1[1] + num.blade1[1],
                           @blade2 + num.blade2)
  end

  # Multivector addition
  def -(num)
    return MultiVector2D.new(@blade0 - num.blade0,
                           @blade1[0] - num.blade1[0],
                           @blade1[1] - num.blade1[1],
                           @blade2 - num.blade2)
  end

  # Dot product (inner product)
  # return 0-vector (scalar)
  # a*b = 1/2 (ab + ba)
  def dot(num)
    return MultiVector2D.new(0.5,0.0,0.0,0.0).geom(self.geom(num) + num.geom(self))
  end

  # Wedge product (outer product)
  # return 2-vector
  # a^b = 1/2 (ab - ba)
  def ^(num)
    #blade0 = @blade0 * num.blade0
    #blade1 = num.blade1 * @blade0 + @blade1 * num.blade0
    #blade2 = @blade0 * num.blade2 + @blade2 * num.blade0 + (@blade1[0] * num.blade1[1]) - (@blade1[1] * num.blade1[0])
    #return MultiVector2D.new(blade0,blade1[0],blade1[1],blade2)
    return MultiVector2D.new(0.5,0.0,0.0,0.0).geom(self.geom(num) - num.geom(self))
  end

  # Geometric product
  # return a multivector
  # ab = a*b + a^b
  #      |  1    e1    e2    e12 
  #------------------------------
  #   1  |  1    e1    e2    e12 
  #  e1  | e1     1    e12   e2 
  #  e2  | e2   -e12    1   -e1
  #  e12 | e12  -e2    e1    -1  
  def geom(num)
    blade0 = @blade0 * num.blade0 +
      @blade1[0] * num.blade1[0] +
      @blade1[1] * num.blade1[1] -
      @blade2 * num.blade2
    blade1 = Vector[@blade0 * num.blade1[0] +
                    @blade1[0] * num.blade0 -
                    @blade1[1] * num.blade2 +
                    @blade2 * num.blade1[1],
                    @blade0 * num.blade1[1] +
                    @blade1[0] * num.blade2 +
                    @blade1[1] * num.blade0 -
                    @blade2 * num.blade1[0]]
    blade2 = @blade0 * num.blade2 +
      @blade1[0] * num.blade1[1] -
      @blade1[1] * num.blade1[0] +
      @blade2 * num.blade0
    return MultiVector2D.new(blade0,blade1[0],blade1[1],blade2)
  end

  # Rotate multivector by given angle
  def rotate(angle)
    return geom(MultiVector2D.new(cos(angle),0.0,0.0,sin(angle)))
  end

  # Return the multivector's grade
  def grade()
    return @grade.to_s
  end

  # Whether the multivector has a given grade
  def isGrade?(grade)
    return @grade.isGrade?(grade)
  end

  # Whether multivector only has elements of a single grade
  def homogeneous?
    return @grade.homogeneous?
  end

  # Return a homogeneous multivector that is the projection of elements
  #   for a given grade
  # @param projGrade Grad to project onto.
  # @return Homogeneous MultiVector2D.
  def getGrade(projGrade)
    case projGrade
      when 0
      return MultiVector2D.new(@blade0,0.0,0.0,0.0) 
      when 1
      return MultiVector2D.new(0.0,@blade1[0],@blade1[1],0.0) 
      when 2
      return MultiVector2D.new(0.0,0.0,0.0,@blade2) 
      else
      print "Error: invalid grade, #{projGrade}"
      return
    end
  end

  # String version of the multivector
  def to_s()
    if @grade.isGrade?(0)
      return "#{@blade0}"
    elsif @grade.isGrade?(1)
      return "(#{@blade1[0]}e1 + #{@blade1[1]}e2)"
    elsif @grade.isGrade?(2)
      return "#{@blade2}e12"
    end
    return "#{@blade0} + (#{@blade1[0]}e1 + #{@blade1[1]}e2) + #{@blade2}e12"
  end

end

