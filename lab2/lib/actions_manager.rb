require 'csv'
require_relative 'csv_actions'

class ActionsManager
  attr_accessor :num_op_value

  def main_action
    csv_director = CsvActions.new('n15.csv')

    puts 'select an operation: 1 - minimum value, 2 - maximum value, 3 - average value, 4 - corrected sample variance'
    choose_op(csv_director)
  end

  def choose_op(csv_director)
    @num_op_value = gets.chomp
    case @num_op_value
    when '1'
      puts 'min: ', csv_director.find_min
    when '2'
      puts 'max: ', csv_director.find_max
    when '3'
      puts 'avg: ', csv_director.find_avg
    when '4'
      puts 'corrected sample variance: ', csv_director.find_corrected_sv
    end
  end
end
