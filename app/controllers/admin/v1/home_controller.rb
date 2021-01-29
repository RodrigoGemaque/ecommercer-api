module Admin::V1
  class HomeController < ApiController  
    def index
      render json: {message: 'Render json index home test'}
    end
  end
end
