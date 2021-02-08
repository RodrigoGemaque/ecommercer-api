require 'rails_helper'

RSpec.describe "Admin::V1::Categories without authentication", type: :request do
#sem user   

  context  "GET /categories" do
    let(:url) {"/admin/v1/categories"}
    let!(:categories) { create_list(:category, 5) } # cria uma variavel categories para pegar do factory bot 5 categorias
    
    #chamada para o endpoint
    #fazendo isso antes de qualquer coisa
    before(:each) { get url }

    # inserindo o unauthenticated access no test
    include_examples "unauthenticated access" # é como se tivesse inserindo os 2 testes do arquivo unauthenticated access
  end

  context  "GET /categories/:id" do
    let(:category) { create(:category) }     
    let(:url) {"/admin/v1/categories/#{category.id}"}
    #chamada para o endpoint
    #fazendo isso antes de qualquer coisa
    before(:each) { get url }

    # inserindo o forbidden access no test
    include_examples "unauthenticated access"# é como se tivesse inserindo os 2 testes do arquivo forbidden access
  end

  context  "POST /categories" do
    let(:url) {"/admin/v1/categories"}
    
    #fazendo isso antes de qualquer coisa
    #chamada para o endpoint
    before(:each) { post url }
    # inserindo o unauthenticated access no test
    include_examples "unauthenticated access" # é como se tivesse inserindo os 2 testes do arquivo unauthenticated access


  end

  context  "PATCH /categories/:id" do
    let(:category) { create(:category) }
    let(:url) { "/admin/v1/categories/#{category.id}" }
    
    #chamada para o endpoint
    #fazendo isso antes de qualquer coisa
    before(:each) { patch url }
    # inserindo o unauthenticated access no test
    include_examples "unauthenticated access" # é como se tivesse inserindo os 2 testes do arquivo unauthenticated access

  end

  context  "DELETE /categories/:id" do
    let(:category) { create(:category) }
    let(:url) { "/admin/v1/categories/#{category.id}" }

    #chamada para o endpoint
    #fazendo isso antes de qualquer coisa
    before(:each) { delete url }
    # inserindo o unauthenticated access no test
    include_examples "unauthenticated access" # é como se tivesse inserindo os 2 testes do arquivo unauthenticated access


  end

  
end