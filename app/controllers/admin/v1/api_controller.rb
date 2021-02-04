module Admin::V1
  class ApiController < ApplicationController
    include Authenticable

    def render_error(message: nil, fields: nil, status: :unprocessable_entity)
      errors = {}
      errors['fields'] = fields if fields.present? #so executa se o fields.present for verdadeiro
      errors['message'] = message if message.present? #so executa se o fields.present for verdadeiro
      render json: {errors: errors}, status: status
    end

  end
end
