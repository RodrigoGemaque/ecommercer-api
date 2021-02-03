require 'rails_helper'

  describe "Home", type: :request do
    
    let(:user) { create(:user) }# criando um user a partir da factory   

    it "Test Home" do
      # fazendo a chamada get solicitando do RequestAPI os headers 
      get '/admin/v1/home', headers: auth_header(user)
      expect(body_json).to eq({'message'=> 'Render json index home test'})
    end

    it "Test Home" do
      # fazendo a chamada get solicitando do RequestAPI os headers 
      get '/admin/v1/home', headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end
  
  end