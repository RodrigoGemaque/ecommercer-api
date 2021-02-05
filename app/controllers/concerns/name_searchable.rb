module NameSearchable
  extend ActiveSupport::Concern  
  included do
    scope :search_by_name, -> (value) do
      self.where("name ILIKE ?", "%#{value}%") #nesse busca o ILIke pega mesmo que seja apena pedaco do valor pesquisado
    end
  end
end

# module NameSearchable
#   extend ActiveSupport::Concern

#   included do
#     scope :search_by_name, -> (value) do
#       self.where("name ILIKE ?", "%#{value}%")
#     end
#   end
# end

