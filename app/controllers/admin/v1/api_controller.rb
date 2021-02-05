module Admin::V1
  class ApiController < ApplicationController
    class ForbiddenAccess < StandardError; end # essa é a classe padrão de erros do rails


    include Authenticable
    #sempre que qualquer endpoint que herda de apicontroller chama o restrict access
    before_action :restrict_access_for_admin!


    def render_error(message: nil, fields: nil, status: :unprocessable_entity)
      errors = {}
      errors['fields'] = fields if fields.present? #so executa se o fields.present for verdadeiro
      errors['message'] = message if message.present? #so executa se o fields.present for verdadeiro
      render json: {errors: errors}, status: status
    end

  #caso a classe ForbiddenAccess for chamada 
  rescue_from ForbiddenAccess do
    render_error(message: "Forbidden access", status: :forbidden)
  end

  private

  def restrict_access_for_admin!
    #para chamar um erro no rails
    raise ForbiddenAccess unless current_user.admin? #chame o erro caso o usuario nao seja o admin    
  end

  end
end
