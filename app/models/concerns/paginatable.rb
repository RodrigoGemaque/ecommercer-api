module Paginatable
  extend ActiveSupport::Concern  
  MAX_PER_PAGE = 10 
  DEFAULT_PAGE = 1


  included do
    scope :paginate, -> (page, length) do
      page = page.present? && page > 0 ? page : DEFAULT_PAGE
      #verifica se a page ta presente e se ela é mair que 0 devolve page os : é o senão que devolve o DAFAULT PAGE
      length = length.present? && length > 0 ? length : MAX_PER_PAGE

      starts_at = (page -1) * length# conta para startar os resultados      
      #ex starts_at se a page = 2 > 2-1 =  1 *10 = 10 a partir do decimo elemento
      limit(length).offset(starts_at)
    end
  end
end
