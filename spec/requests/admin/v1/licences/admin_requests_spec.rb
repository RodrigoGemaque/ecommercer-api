require 'rails_helper'

RSpec.describe "Admin::V1::Licences", type: :request do
  let(:user) { create(:user) }  
 
 
  context "GET /licences" do  
    let(:url) { "/admin/v1/licences" }
    let!(:licences) { create_list(:licence, 10) }
    
    context "without any params" do
      
      it "returns 10 Licences" do
        get url, headers: auth_header(user)
        # p body_json['licences']
        expect(body_json['licences'].count).to eq 10
      end
      it "returns 10 first Licences" do
        get url, headers: auth_header(user)
        expected_licences = licences[0..9].as_json(only: %i(id key))
        # p expected_licences
        expect(body_json['licences']).to contain_exactly *expected_licences
      end 

      it "returns success status" do
        get url, headers: auth_header(user)
        expect(response).to have_http_status(:ok)
      end
    end
   
    

  end

end
