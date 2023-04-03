RSpec.describe City, :type => :model do
  describe 'Attributes' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:data).of_type(:jsonb) }
  end
end