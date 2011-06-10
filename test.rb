#!/usr/bin/ruby -w

#require 'geometricAlgebra'
require 'multiVector2D'
require 'multiVector3D'

puts "MultiVector Test"

num1 = MultiVector2D.new(0,1.0,0,0)
num2 = MultiVector2D.new(0,0,0,3.0)
num3 = MultiVector2D.new(4.0,0,0,0)
num4 = MultiVector2D.new(1.0,2.0,3.0,4.0)
num5 = MultiVector2D.new(0,2.0,1.0,0)
num6 = MultiVector2D.new(0,0,1.0,0)
num7 = MultiVector2D.new(0,1.0,1.0,0)
num8 = MultiVector2D.new(0,0.5,0.5,0)

puts ""
puts "Grades"
puts "num1: #{num1}, grade: #{num1.grade}"
puts "num2: #{num2}, grade: #{num2.grade}"
puts "num3: #{num3}, grade: #{num3.grade}"
puts "num4: #{num4}, grade: #{num4.grade}"
puts "num5: #{num5}, grade: #{num5.grade}"

add11 = num1 + num1
add12 = num1 + num2
add13 = num1 + num3
add14 = num1 + num4
add15 = num1 + num5
add51 = num5 + num1

puts ""
puts "Addition"
puts "num1 + num1 = #{add11}"
puts "num1 + num2 = #{add12}"
puts "num1 + num3 = #{add13}"
puts "num1 + num4 = #{add14}"
puts "num1 + num5 = #{add15}"
puts "num5 + num1 = #{add51}"

#wedge11 = num1.wedge(num1)
#wedge12 = num1.wedge(num2)
#wedge13 = num1.wedge(num3)
#wedge14 = num1.wedge(num4)
#wedge15 = num1.wedge(num5)
#wedge51 = num5.wedge(num1)

wedge11 = num1 ^ num1
wedge12 = num1 ^ num2
wedge13 = num1 ^ num3
wedge14 = num1 ^ num4
wedge15 = num1 ^ num5
wedge51 = num5 ^ num1

puts ""
puts "Wedge Product"
puts "num1 ^ num1 = #{wedge11}"
puts "num1 ^ num2 = #{wedge12}"
puts "num1 ^ num3 = #{wedge13}"
puts "num1 ^ num4 = #{wedge14}"
puts "num1 ^ num5 = #{wedge15}"
puts "num5 ^ num1 = #{wedge51}"

dot11 = num1.dot(num1)
dot12 = num1.dot(num2)
dot13 = num1.dot(num3)
dot14 = num1.dot(num4)
dot15 = num1.dot(num5)
dot51 = num5.dot(num1)

puts ""
puts "Dot Product"
puts "num1 . num1 = #{dot11}"
puts "num1 . num2 = #{dot12}"
puts "num1 . num3 = #{dot13}"
puts "num1 . num4 = #{dot14}"
puts "num1 . num5 = #{dot15}"
puts "num5 . num1 = #{dot51}"


geom11 = num1.geom(num1)
geom12 = num1.geom(num2)
geom13 = num1.geom(num3)
geom14 = num1.geom(num4)
geom15 = num1.geom(num5)
geom51 = num5.geom(num1)

puts ""
puts "Geometric Product"
puts "num1 num1 = #{geom11}"
puts "num1 num2 = #{geom12}"
puts "num1 num3 = #{geom13}"
puts "num1 num4 = #{geom14}"
puts "num1 num5 = #{geom15}"
puts "num5 num1 = #{geom51}"

puts ""
puts "Rotation"
puts "num1 rotate(PI) = #{num1.rotate(Math::PI)}"
puts "num1 rotate(PI/2) = #{num1.rotate(Math::PI/2)}"
puts "num1 rotate(-PI/2) = #{num1.rotate(-Math::PI/2)}"
puts "num6 rotate(1) = #{num6.rotate(1)}"
puts "num6 rotate(1/2) = #{num6.rotate(1.0/2)}"
puts "num6 rotate(-1/2) = #{num6.rotate(-1.0/2)}"
puts "num7 rotate(1) = #{num7.rotate(1)}"
puts "num7 rotate(1/2) = #{num7.rotate(1.0/2)}"
puts "num7 rotate(-1/2) = #{num7.rotate(-1.0/2)}"
puts "num8 rotate(1) = #{num8.rotate(1)}"
puts "num8 rotate(1/2) = #{num8.rotate(1.0/2)}"
puts "num8 rotate(-1/2) = #{num8.rotate(-1.0/2)}"


# MultiVector3D
ber1 = MultiVector3D.new(0,1,2,3,0,0,0,0)
ber2 = MultiVector3D.new(0,0,0,0,3,0,0,0)
ber3 = MultiVector3D.new(4,0,0,0,0,0,0,0)
ber4 = MultiVector3D.new(0,0,0,0,0,0,0,2)
ber5 = MultiVector3D.new(1,2,3,4,4,3,2,1)

puts ""
puts "Grades"
puts "ber1: #{ber1}, grade: #{ber1.grade}"
puts "ber2: #{ber2}, grade: #{ber2.grade}"
puts "ber3: #{ber3}, grade: #{ber3.grade}"
puts "ber4: #{ber4}, grade: #{ber4.grade}"
puts "ber5: #{ber5}, grade: #{ber5.grade}"


add11 = ber1 + ber1
add12 = ber1 + ber2
add13 = ber1 + ber3
add14 = ber1 + ber4
add15 = ber1 + ber5
add51 = ber5 + ber1

puts ""
puts "Addition"
puts "ber1 + ber1 = #{add11}"
puts "ber1 + ber2 = #{add12}"
puts "ber1 + ber3 = #{add13}"
puts "ber1 + ber4 = #{add14}"
puts "ber1 + ber5 = #{add15}"
puts "ber5 + ber1 = #{add51}"
