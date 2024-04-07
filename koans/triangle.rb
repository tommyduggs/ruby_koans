# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  validate_triangle(a, b, c)

  return :equilateral if (a == b && b == c)
  return :isosceles if (a == b || a == c || b == c)
  return :scalene
end

def validate_triangle(a, b, c)
  side_lengths = [a, b, c].sort
  side_lengths.each do |side_length|
    raise TriangleError, "The values passed in must be numeric" unless side_length.is_a?(Numeric)
    raise TriangleError, "The length of a side may not be zero" if side_length == 0
    raise TriangleError, "The length of a side may not be negative" if side_length <= 0
  end

  if (side_lengths[0] + side_lengths[1]) <= side_lengths[2]
    raise TriangleError, "The sum of the two shorter sides must be greater than the longest side"
  end
end

# Error class used in part 0.  No need to change this code.
class TriangleError < StandardError
end
