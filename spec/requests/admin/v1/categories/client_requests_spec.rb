require 'rails_helper'

RSpec.describe "Admin::V1::Categories as :client", type: :request do
  let(:user) { create(:user, profile: :client) }
  

  context  "GET /categories" do
    let(:url) {"/admin/v1/categories"}
    let!(:categories) { create_list(:category, 5) } # cria uma variavel categories para pegar do factory bot 5 categorias
    
    #chamada para o endpoint
    #fazendo isso antes de qualquer coisa
    before(:each) { get url, headers: auth_header(user) }

    # inserindo o forbidden access no test
    include_examples "forbidden access" # é como se tivesse inserindo os 2 testes do arquivo forbidden access
  end

  context  "GET /categories/:id" do
    let(:category) { create(:category) }     
    let(:url) {"/admin/v1/categories/#{category.id}"}
    #chamada para o endpoint
    #fazendo isso antes de qualquer coisa
    before(:each) { get url, headers: auth_header(user) }

    # inserindo o forbidden access no test
    include_examples "forbidden access" # é como se tivesse inserindo os 2 testes do arquivo forbidden access
  end

  context  "POST /categories" do
    let(:url) {"/admin/v1/categories"}
    
    #fazendo isso antes de qualquer coisa
    #chamada para o endpoint
    before(:each) { post url, headers: auth_header(user) }
    # inserindo o forbidden access no test
    include_examples "forbidden access" # é como se tivesse inserindo os 2 testes do arquivo forbidden access


  end

  context  "PATCH /categories/:id" do
    let(:category) { create(:category) }
    let(:url) { "/admin/v1/categories/#{category.id}" }
    
    #chamada para o endpoint
    #fazendo isso antes de qualquer coisa
    before(:each) { patch url, headers: auth_header(user) }
    # inserindo o forbidden access no test
    include_examples "forbidden access" # é como se tivesse inserindo os 2 testes do arquivo forbidden access

  end

  context  "DELETE /categories/:id" do
    let(:category) { create(:category) }
    let(:url) { "/admin/v1/categories/#{category.id}" }

    #chamada para o endpoint
    #fazendo isso antes de qualquer coisa
    before(:each) { delete url, headers: auth_header(user) }
    # inserindo o forbidden access no test
    include_examples "forbidden access" # é como se tivesse inserindo os 2 testes do arquivo forbidden access


  end

  
end