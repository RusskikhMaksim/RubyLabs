require_relative '../lib/converter'

RSpec.describe Converter do
  let(:converter_obj) { Converter.new }
  describe '.convert_celsius' do
    context 'when conversion to kelvin' do
      it do
        converter_obj.num_of_degrees = -273.15
        converter_obj.from_scale = 'C'
        converter_obj.to_scale = 'K'

        expect(converter_obj.converter_action).to eq 0
      end
    end
    context 'when conversion to fahrenheit' do
      it do
        converter_obj.num_of_degrees = 100
        converter_obj.from_scale = 'C'
        converter_obj.to_scale = 'F'

        expect(converter_obj.converter_action).to eq 212
      end
    end
  end
  describe '.convert_kelvins' do
    context 'when conversion to celsius' do
      it do
        converter_obj.num_of_degrees = 255.37
        converter_obj.from_scale = 'K'
        converter_obj.to_scale = 'C'

        expect(converter_obj.converter_action).to eq(-17.78)
      end
    end
    context 'when conversion to fahrenheit' do
      it do
        converter_obj.num_of_degrees = 273.15
        converter_obj.from_scale = 'K'
        converter_obj.to_scale = 'F'

        expect(converter_obj.converter_action).to eq 32
      end
    end
  end
  describe '.convert_fahrenheit' do
    context 'when conversion to celsius' do
      it do
        converter_obj.num_of_degrees = 98.2
        converter_obj.from_scale = 'F'
        converter_obj.to_scale = 'C'

        expect(converter_obj.converter_action).to eq 36.78
      end
    end
    context 'when conversion to kelvin' do
      it do
        converter_obj.num_of_degrees = 9980
        converter_obj.from_scale = 'F'
        converter_obj.to_scale = 'K'

        expect(converter_obj.converter_action).to eq 5799.82
      end
    end
  end
end
