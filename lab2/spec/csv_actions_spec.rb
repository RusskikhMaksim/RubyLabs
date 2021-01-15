require_relative '../lib/csv_actions'
require 'csv'

RSpec.describe CsvActions do
  let(:csv_actions_obj) { CsvActions.new("test.csv") }
  describe '.find_min' do
    it do
      csv_actions_obj.find_min
      expect(csv_actions_obj.min).to eq 3.8
    end
  end

  describe '.find_max' do
    it do
      csv_actions_obj.find_max
      expect(csv_actions_obj.max).to eq 1872.3
    end
  end

  describe '.find_avg' do
    it do
      csv_actions_obj.find_avg
      expect(csv_actions_obj.avg).to eq 154.24
    end
  end

  describe '.find_corrected_sv' do
    it do
      csv_actions_obj.find_corrected_sv
      expect(csv_actions_obj.corrected_sv).to eq 215_229.73
    end
  end
end
