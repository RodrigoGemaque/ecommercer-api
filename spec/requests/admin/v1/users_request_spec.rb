require 'rails_helper'

RSpec.describe "Admin::V1::Users", type: :request do
  let(:user) { create(:user) }  

  context "GET /users" do
    let(:url) { "/admin/v1/users" }
    # let!(:users) {create_list(:user, 1) }

    it "returns all Users" do 
      get url, headers: auth_header(user)
      expect(body_json['users']).to contain_exactly user.as_json(only: %i(id name email  ))
    end

    it "returns success status" do
      get url, headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end
  end  

  context "POST /users" do
    let(:url) {"/admin/v1/users"}

    context "with a valid params" do 
      let(:users_params) { { user: attributes_for(:user)}.to_json }
      
      it "adds a New User" do
        expect do
          post url, headers: auth_header(user), params: users_params
        end.to change(User, :count).by(2) 
      end

      it 'returns last added User' do
        post url, headers: auth_header(user), params: users_params
        expected_user = User.last.as_json(only: %i(id name email   ))
        expect(body_json['user']).to eq expected_user
      end

      it "returns succes status  " do
        post url, headers: auth_header(user), params: users_params
        expect(response).to have_http_status(:ok)
      end    
    end


    context "with a invalid params" do 

      let(:user_invalid_params)  {{ user: attributes_for(:user, name: nil) }.to_json }
    
      # it 'does not add a new User' do
        # expect do
          # post url, headers: auth_header(user), params: user_invalid_params          
        # end.to_not change(User, :count)
      # end  

      it 'returns error message' do
        post url, headers: auth_header(user), params: user_invalid_params
        expect(body_json['errors']['fields']).to have_key('name')
      end
 
      it 'returns unprocessable_entity Users' do
        post url, headers: auth_header(user), params: user_invalid_params 
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  
  
  end

  context "PATCH /users/:id" do
    # let(:user) { create(:user) }
    let(:url) { "/admin/v1/users/#{user.id}" }

    context "with valid params" do
      let(:new_name) { 'My new Category' }
      let(:category_params) { { user: { name: new_name } }.to_json }

      it 'updates User' do
        patch url, headers: auth_header(user), params: category_params
        user.reload
        expect(user.name).to eq new_name
      end

      it 'returns updated User' do
        patch url, headers: auth_header(user), params: category_params
        user.reload
        expected_category = user.as_json(only: %i(id name email ))
        expect(body_json['user']).to eq expected_category
      end

      it 'returns success status' do
        patch url, headers: auth_header(user), params: category_params
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do

      let(:user_invalid_params) do 
        { user: attributes_for(:coupon, name: nil) }.to_json
      end

      it 'does not update User' do
        old_name = user.name
        patch url, headers: auth_header(user), params: user_invalid_params
        user.reload
        expect(user.name).to eq old_name
      end

      it 'returns error message' do
        patch url, headers: auth_header(user), params: user_invalid_params
        expect(body_json['errors']['fields']).to have_key('name')
      end

      it 'returns unprocessable_entity status' do
        patch url, headers: auth_header(user), params: user_invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end



    end
     
  end

  context  "DELETE /users/:id" do
    let(:url) { "/admin/v1/users/#{user.id}" }

    it 'Removes Users' do 
      expect do
        delete url, headers: auth_header(user)
      end.to change(User, :count ).by(-1)      
    end

    # it "returns succes status  " do
      # delete url, headers: auth_header(user)
      # expect(response).to have_http_status(:no_content)
    # end
# 
    # it 'does not return any body content' do
      # delete url, headers: auth_header(user)
      # expect(body_json).to_not be_present
    # end
  end
  
end
