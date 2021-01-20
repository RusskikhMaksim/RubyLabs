require_relative '../lib/csv_actions'
require 'csv'

RSpec.describe CsvActions do
  let(:csv_actions_obj) { CsvActions.new('test.csv') }
  describe '.find_min' do
    it do
      expect(csv_actions_obj.find_min).to eq 3.8
    end
  end

  describe '.find_max' do
    it do
      expect(csv_actions_obj.find_max).to eq 1872.3
    end
  end

  describe '.find_avg' do
    it do
      csv_actions_obj.find_avg
      expect(csv_actions_obj.avg).to eq 303.83
    end
  end

  describe '.find_corrected_sv' do
    it do
      csv_actions_obj.find_corrected_sv
      expect(csv_actions_obj.corrected_sv).to eq 218_718.38
    end
  end
end
