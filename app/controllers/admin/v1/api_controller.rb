module Admin::V1
  class ApiController < ApplicationController
    wrap_parameters format: [:json, :xml, :url_encoded_form, :multipart_form]
    class ForbiddenAccess < StandardError; end # essa é a classe padrão de erros do rails

    include Authenticable
    include SimpleErrorRenderable#concern de erros
    self.simple_error_partial = "shared/simple_error"
    
    

  #caso a classe ForbiddenAccess for chamada 
  rescue_from ForbiddenAccess do
    render_error(message: "Forbidden access", status: :forbidden)
  end
  
  #sempre que qualquer endpoint que herda de apicontroller chama o restrict access
  before_action :restrict_access_for_admin!

  private

  def restrict_access_for_admin!
    #para chamar um erro no rails
    raise ForbiddenAccess unless current_user.admin? #chame o erro caso o usuario nao seja o admin    
  end

  end
end
