class CsvActions
  attr_reader :avg, :corrected_sv
  attr_writer :file

  def initialize(filename)
    @file = CSV.read("#{__dir__}/#{filename}")
    @data = []
    @file.each do |row|
      row.each do |elem|
        @data << elem.to_f if row.index(elem) != 0
      end
    end
    @count_of_elements = @data.count
  end

  def find_max
    @data.max
  end

  def find_min
    @data.min
  end

  def find_avg
    sum_of_all_elements = @data.inject { |sum, elem| sum.to_f + elem.to_f }
    @avg = (sum_of_all_elements / @count_of_elements).round(2)
  end

  def find_corrected_sv
    find_avg
    sum_of_subtracts = @data.inject { |sum, elem| sum + (elem - @avg)**2 }
    divider = @count_of_elements - 1
    @corrected_sv = (sum_of_subtracts / divider).round(2)
  end
end
