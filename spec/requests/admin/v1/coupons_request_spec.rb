require 'rails_helper'

RSpec.describe "Admin::V1::Coupons", type: :request do
  let(:user) { create(:user) }  

  context  "GET /coupons" do
    let(:url) {"/admin/v1/coupons"} 
    # seta para  a variavel url o caminho  para teste de contexto de get    
    let!(:coupons) { create_list(:coupon, 5) } # cria uma variavel coupons para pegar do factory bot 5 categorias

    
    it "return all Coupons" do 
      get url, headers: auth_header(user)
      expect(body_json['coupons']).to  contain_exactly *coupons.as_json(only: %i(id code status discount_value due_date ))
      puts{body_json['coupons']}
    end
    
    it "returns succes status  " do
      get url, headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end
  end

  context  "POST /coupons" do
    let(:url) {"/admin/v1/coupons"} 

    context "with a valid params" do
      let(:coupons_params) { { coupon: attributes_for(:coupon) }.to_json }
 
      it 'adds a new Coupon' do 
        expect do
          post url, headers: auth_header(user), params: coupons_params
        end.to change(Coupon, :count).by(1)   
      end
 
      it 'returns last added Coupon' do
        post url, headers: auth_header(user), params: coupons_params
        expected_coupon = Coupon.last.as_json(only: %i(id code status discount_value due_date  ))
        expect(body_json['coupon']).to eq expected_coupon
      end
 
     

      it "returns succes status  " do
        post url, headers: auth_header(user), params: coupons_params
        expect(response).to have_http_status(:ok)
      end
 
    end

    context "with a invalid params" do
      let(:coupon_invalid_params) do 
        { coupon: attributes_for(:coupon, code: nil) }.to_json
      end

      it 'does not add a new Coupon' do
        expect do
          post url, headers: auth_header(user), params: coupon_invalid_params          
        end.to_not change(Coupon, :count)
      end

      it 'returns error message' do
        post url, headers: auth_header(user), params: coupon_invalid_params
        expect(body_json['errors']['fields']).to have_key('code')
      end
 
      it 'returns unprocessable_entity status' do
        post url, headers: auth_header(user), params: coupon_invalid_params          
        expect(response).to have_http_status(:unprocessable_entity)
      end
 

    end
  end

  context  "PATCH /coupons/:id" do
    let(:coupon) { create(:coupon) }
    let(:url) { "/admin/v1/coupons/#{coupon.id}" }

    context "with valid params" do
      let(:new_code) { Faker::Commerce.unique.promotion_code(digits: 4)}
      let(:new_status)  {%i(active inactive).sample }
      let(:new_discount_value)  { rand(1..99) }
      let(:new_due_date)  { 3.days.from_now }
      
      let(:coupon_params) { { coupon: { code: new_code, status: new_status, discount_value: new_discount_value, due_date: new_due_date } }.to_json }

      
      it 'updates Coupon' do
        patch url, headers: auth_header(user), params: coupon_params
        coupon.reload
        expect(coupon.code).to eq new_code
      end

      it 'returns updated Coupons' do
        patch url, headers: auth_header(user), params: coupon_params
        coupon.reload
        expected_coupon = coupon.as_json(only: %i( id code status discount_value due_date ))
        expect(body_json['coupon']).to eq expected_coupon
      end

 
      it 'returns success status' do
        patch url, headers: auth_header(user), params: coupon_params
        expect(response).to have_http_status(:ok)
      end
  
    end

    context "with invalid params" do
        
      let(:coupon_invalid_params) do 
        { coupon: attributes_for(:coupon, status: nil) }.to_json
      end

      it 'does not update Coupon' do
        old_code = coupon.status
        patch url, headers: auth_header(user), params: coupon_invalid_params
        coupon.reload
        expect(coupon.status).to eq old_code

      end

      it 'returns error message' do
        patch url, headers: auth_header(user), params: coupon_invalid_params
        expect(body_json['errors']['fields']).to have_key('status')
      end
      
      it 'returns unprocessable_entity status' do
        patch url, headers: auth_header(user), params: coupon_invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

  
  end

  context  "DELETE /coupons/:id" do
    let!(:coupon) { create(:coupon) }
    let(:url) { "/admin/v1/coupons/#{coupon.id}" }

    it 'Removes Coupon' do 
      expect do
        delete url, headers: auth_header(user)
      end.to change(Coupon, :count ).by(-1)      
    end

    it "returns succes status  " do
      delete url, headers: auth_header(user)
      expect(response).to have_http_status(:no_content)
    end

    it 'does not return any body content' do
      delete url, headers: auth_header(user)
      expect(body_json).to_not be_present
    end

  end


end
