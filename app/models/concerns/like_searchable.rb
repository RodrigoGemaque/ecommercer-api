module LikeSearchable
  extend ActiveSupport::Concern  
  included do
    scope :like, -> (key,value) do
      # self.where("#{key} ILIKE ?", "%#{value}%") #nesse busca o ILIke pega mesmo que seja apena pedaco do valor pesquisado
      #nesse busca o ILIke pega mesmo que seja apena pedaco do valor pesquisado
      # o ILIKE pode ocasionar sql injection


      self.where(self.arel_table[key].matches("%#{value}%")) 
      #o arel_table consegue fazer esse filtro de forma mais segura
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

