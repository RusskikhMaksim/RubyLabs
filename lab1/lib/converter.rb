class Converter
  attr_reader :converted_degrees
  attr_writer :num_of_degrees, :from_scale, :to_scale

  def converter_action
    @converted_degrees = convert_degrees.round(2)
  end

  def convert_degrees
    case @from_scale
    when 'C'
      convert_celsius
    when 'K'
      convert_kelvin
    when 'F'
      convert_fahrenheit
    end
  end

  def convert_celsius
    if @to_scale == 'K'
      @num_of_degrees.to_f + 273.15
    else
      @num_of_degrees.to_f * 1.8 + 32
    end
  end

  def convert_kelvin
    if @to_scale == 'C'
      @num_of_degrees.to_f - 273.15
    else
      @num_of_degrees.to_f * 1.8 - 459.67
    end
  end

  def convert_fahrenheit
    if @to_scale == 'C'
      (@num_of_degrees.to_f - 32) / 1.8
    else
      (@num_of_degrees.to_f + 459.67) / 1.8
    end
  end
end
