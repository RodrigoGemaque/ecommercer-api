module Admin::V1
  class LicencesController < ApiController
    
    def index
      @licences = Licence.all
    end
    


  end
end