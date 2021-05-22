require 'rails_helper'

RSpec.describe "Admin::V1::Licenses without authentication", type: :request do
#sem user   
let(:game) { create(:game) }

  context  "GET /games/:game_id/licenses" do
    let(:url) {"/admin/v1/games/#{game.id}/licenses"}
    let!(:licenses) { create_list(:license, 5) } # cria uma variavel licenses para pegar do factory bot 5 categorias
   
    #chamada para o endpoint
    #fazendo isso antes de qualquer coisa
    before(:each) { get url }

    # inserindo o unauthenticated access no test
    include_examples "unauthenticated access" # é como se tivesse inserindo os 2 testes do arquivo unauthenticated access
  end

  context  "GET /licenses/:id" do
    let(:license) { create(:license) }     
    let(:url) {"/admin/v1/licenses/#{license.id}"}
    #chamada para o endpoint
    #fazendo isso antes de qualquer coisa
    before(:each) { get url }

    # inserindo o forbidden access no test
    include_examples "unauthenticated access"# é como se tivesse inserindo os 2 testes do arquivo forbidden access
  end

  context  "POST /games/:game_id/licenses" do
    let(:url) {"/admin/v1/games/#{game.id}/licenses"}
    
    #fazendo isso antes de qualquer coisa
    #chamada para o endpoint
    before(:each) { post url }
    # inserindo o unauthenticated access no test
    include_examples "unauthenticated access" # é como se tivesse inserindo os 2 testes do arquivo unauthenticated access


  end

  context  "PATCH /licenses/:id" do
    let(:license) { create(:license) }
    let(:url) { "/admin/v1/licenses/#{license.id}" }
    
    #chamada para o endpoint
    #fazendo isso antes de qualquer coisa
    before(:each) { patch url }
    # inserindo o unauthenticated access no test
    include_examples "unauthenticated access" # é como se tivesse inserindo os 2 testes do arquivo unauthenticated access

  end

  context  "DELETE /licenses/:id" do
    let(:license) { create(:license) }
    let(:url) { "/admin/v1/licenses/#{license.id}" }

    #chamada para o endpoint
    #fazendo isso antes de qualquer coisa
    before(:each) { delete url }
    # inserindo o unauthenticated access no test
    include_examples "unauthenticated access" # é como se tivesse inserindo os 2 testes do arquivo unauthenticated access


  end

  
end