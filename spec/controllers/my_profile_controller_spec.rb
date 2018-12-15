describe ProfilesController, :type => :controller do
  before do
    sign_in eve, scope: :user
  end

  describe '#show' do
    let(:person) { FactoryGirl.create(:user) }
    let(:presenter) { double(:as_json => {:rock_star => "Jose Maria"})}

    it "search Presenter post" do
      expect(Person).to receive(:find_by_guid!).with("12345").and_return(person)
      expect(PersonPresenter).to receive(:new).with(person, eve).and_return(presenter)

      get :show, params: {id: 12_345}, format: :json
      expect(response.body).to eq({:rock_star => "Jose Maria"}.to_json)
    end

    it "can't be nil" do
      expect(Person).to receive(:find_by_guid!).with("12345").and_return(person)
      expect(PersonPresenter).to receive(:new).with(person, eve).and_return(presenter)

      get :show, params: {id: 12_345}, format: :json
      expect(response.body).not_to be_nil
    end
  end
end
