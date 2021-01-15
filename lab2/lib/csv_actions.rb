class CsvActions
  attr_reader :max, :min, :avg, :corrected_sv
  attr_writer :file


  def initialize(filename)
    @file = CSV.read("#{__dir__}/#{filename}")
  end

  def find_max
    @max = -1
    @file.each do |items|
      items.each do |item|
        @max = item.to_f if item.to_f > @max
      end
    end
  end

  def find_min
    @min = 99_999
    @file.each do |items|
      items.each do |item|
        @min = item.to_f if item.to_f < @min && items.index(item) != 0
      end
    end
  end

  def find_avg
    avg_value = 0
    avg_per_row = 0
    items_count = 0
    @file.each do |items|
      items_count = items.count - 1
      items.each do |item|
        avg_per_row += item.to_f
      end
      avg_per_row /= items_count
      avg_value += avg_per_row
    end
    @avg = (avg_value / @file.count).round(2)
  end

  def find_corrected_sv
    row_sum = 0
    find_avg
    elems_count = @file.count * (@file[0].count - 1)
    row_sum = find_corrected_sv_action(elems_count, row_sum)
    @corrected_sv = ((row_sum * elems_count) / (elems_count - 1)).round(2)
  end

  def find_corrected_sv_action(elems_count, row_sum)
    @file.each do |items|
      items.each do |item|
        row_sum += ((item.to_f - @avg)**2).to_f
      end
    end
    row_sum /= elems_count
  end
end
