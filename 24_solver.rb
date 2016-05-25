require 'pry'
class TwentyFourSolver
  attr_accessor :all_expressions

  OPERATION_SET = ["+","-","/","*"].repeated_permutation(3).to_a

  def initialize 
    @all_expressions = []
  end

  def solve(a)                         
    make_possible_solutions(get_sets_of_numbers(a))

    solutions = find_solutions

    puts "#{solutions.first} = 24"
    puts "I found #{solutions.count} solutions."
  end 

  def get_sets_of_numbers(a)
    a.permutation(4).to_a.tap do |numbers|
      numbers.each { |set| set.map!(&:to_f)}
    end
  end

  def make_possible_solutions(nums)
    expressions = []

    nums.each do |num|
      OPERATION_SET.each {|op| expressions << num.zip(op).flatten.compact}
    end 

    add_all_possible_order_of_ops(expressions)
  end

  def add_all_possible_order_of_ops(expressions)
    all_expressions.tap do |expos|
      expos << add_order_of_operations(expressions)
    end
  end
 
  def add_order_of_operations(expressions)
    [].tap do |temp_storage|  
      expressions.each do |exp|   
        temp_storage << exp.dup.insert(0, "(").insert(4, ")") 
        temp_storage << exp.dup.insert(0, "(").insert(6, ")")
        temp_storage << exp.dup.insert(2, "(").insert(8, ")")
        temp_storage << exp.dup.insert(4, "(").insert(8, ")")
        temp_storage << exp.dup.insert(0, "(").insert(4, ")").insert(6, "(").insert(10, ")") 
      end
    end
  end


  def find_solutions
    [].tap do |solutions|
      all_expressions.each do |wrapper|

        wrapper.each do |exp|
          value = eval(exp.join)
          solutions << exp.join(" ") if value == 24
        end
      end
    end
  end
end

# TwentyFourSolver.new.solve([1,5,6,4])

# #2, 3, 5, 12
# #1, 4, 5, 6