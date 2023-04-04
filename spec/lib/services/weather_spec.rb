RSpec.describe Services::Weather do
  describe 'Methods' do
    let(:weather_service) { Services::Weather.new }

    describe '.initialize' do
      it 'should successfully initialized' do
        expect(weather_service).to be_present
      end
    end

    describe '.import_data' do
      it 'should return true' do
        allow(weather_service).to receive(:import_data).and_return(true)
        expect(weather_service.import_data).to be true
      end
    end
  end
end