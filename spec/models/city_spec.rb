RSpec.describe City, :type => :model do
  describe 'Attributes' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:average_temperature).of_type(:float) }
    it { is_expected.to have_db_column(:data).of_type(:jsonb) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'Methods' do
    before(:all) do
      Services::Weather.new.import_data
    end

    describe '#sort_by_average_temperature' do
      it 'should return sorted cities by average temperature' do
        sorted_cities = City.sort_by_average_temperature
        expect(sorted_cities.count).to eq City.count
        expect(sorted_cities).to eq City.order(average_temperature: :desc)
      end
    end

    describe '#average_temperatures' do
      it 'should return cities with average temperature' do
        cities_with_average_temperature = City.average_temperatures(cities: City.all.pluck(:name), start_interval: 10, end_interval: 20)
        expect(cities_with_average_temperature.count).to eq City.count
        expect(cities_with_average_temperature["#{City.first.name}"]).to be_present
      end
    end
  end
end