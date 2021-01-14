require_relative 'converter'

class ConversionMaker
  def make_a_conversion
    convert_obj = Converter.new
    input_data(convert_obj)
    convert_obj.converter_action
    print_converted_degrees(convert_obj)
  end

  def input_data(convert_obj)
    puts 'Enter the number of degrees:'
    convert_obj.num_of_degrees = gets.chomp
    puts 'from:'
    convert_obj.from_scale = gets.chomp
    puts 'to:'
    convert_obj.to_scale = gets.chomp
  end

  def print_converted_degrees(convert_obj)
    puts convert_obj.converted_degrees
  end
end
