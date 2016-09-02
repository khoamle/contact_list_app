require 'rails_helper'

describe ContactsController do

  describe 'GET #index' do
    context 'without params[]' do
      it "populates an array of all contacts" do
        john = create(:contact, last_name: 'John')
        dick = create(:contact, last_name: 'Dick')
        get :index
        expect(assigns(:contacts)).to match_array([john, dick])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #new' do
    it "assigns a new Contact to @contact" do
      get :new
      expect(assigns(:contact)).to be_a_new(Contact)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested contact to @contact" do
      contact = create(:contact)
      get :edit, id: contact
      expect(assigns(:contact)).to eq contact
    end

    it 'renders the :new template' do
      contact = create(:contact)
      get :edit, id: contact
      expect(response).to render_template :edit
    end
  end
end
