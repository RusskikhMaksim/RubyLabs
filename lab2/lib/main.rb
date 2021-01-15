require 'csv'
require_relative 'csv_actions'

class Main
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
      csv_director.find_min
      puts 'min: ', csv_director.min
    when '2'
      csv_director.find_max
      puts 'max: ', csv_director.max
    when '3'
      csv_director.find_avg
      puts 'avg: ', csv_director.avg
    when '4'
      csv_director.find_corrected_sv
      puts 'corrected sample variance: ', csv_director.corrected_sv
    end
  end
end

m = Main.new
m.main_action
