require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    let(:groups) { create_list(:group, 3) }
    let(:picture) { fixture_file_upload("#{Rails.root}/spec/fixtures/pictures/girls.jpg", 'image/jpg') }
    let(:books) { create_list(:book, 3, picture: picture, group: groups.first) }

    before { get :index }

    it 'populates an array of all groups' do
      expect(assigns(:groups)).to match_array(groups)
    end

    it 'populates an array of all books' do
      expect(groups.first.books).to eq books
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
