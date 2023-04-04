RSpec.describe CitiesController, type: :controller do

  before(:all) do
    Services::Weather.new.import_data
  end

  describe "GET index" do
    it 'returns a successful response with cities' do
      get :index
      expect(response).to be_successful
      expect(JSON.parse(response.body)['cities'].size).to eq City.count
    end
  end

  describe "GET sorted" do
    it 'returns a successful response with sorted cities' do
      get :sorted
      expect(response).to be_successful
      expect(JSON.parse(response.body)['cities']).to eq City.order(average_temperature: :desc).pluck(:name)
    end
  end
end