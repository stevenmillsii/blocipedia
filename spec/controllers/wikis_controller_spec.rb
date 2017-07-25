require 'rails_helper'

RSpec.describe WikisController, type: :controller do

  let(:my_wiki) { Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_wiki] to @wikis" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end

#  describe "GET #show" do
#    it "returns http success" do
#      get :show
#      expect(response).to have_http_status(:success)
#    end
#  end
<<<<<<< HEAD

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @wiki" do
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end

  describe "POST create" do

    it "increases the number of Wiki by 1" do
      expect{wiki :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false}}.to change(Wiki,:count).by(1)
    end

    it "assigns the new wiki to @wiki" do
      wiki :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false}
      expect(assigns(:wiki)).to eq Wiki.last
    end

    it "redirects to the new wiki" do
      wiki :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false}
      expect(response).to redirect_to Wiki.last
    end
  end
=======
  #
  # describe "GET #new" do
  #   before(:all) do
  #     sign_in FactoryGirl.create(:user)
  #   end
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #   it "renders the #new view" do
  #     get :new
  #     expect(response).to render_template :new
  #   end
  #
  #   it "instantiates @wiki" do
  #     get :new
  #     expect(assigns(:wiki)).not_to be_nil
  #   end
  # end
  #
  # describe "POST create" do
  #
  #   it "increases the number of Wiki by 1" do
  #     expect{wiki :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false}}.to change(Wiki,:count).by(1)
  #   end
  #
  #   it "assigns the new wiki to @wiki" do
  #     wiki :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false}
  #     expect(assigns(:wiki)).to eq Wiki.last
  #   end
  #
  #   it "redirects to the new wiki" do
  #     wiki :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false}
  #     expect(response).to redirect_to Wiki.last
  #   end
  # end
>>>>>>> blocipedia-4-crud

#  describe "GET #edit" do
#    it "returns http success" do
#      get :edit
#      expect(response).to have_http_status(:success)
#    end
#  end

end
