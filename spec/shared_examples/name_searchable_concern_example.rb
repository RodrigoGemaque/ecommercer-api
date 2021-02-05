shared_examples "name searchable concern" do  |factory_name| # o |factory name | serve para receber os parametros
  let!(:search_params) {'Example'} #parametro de busca 
  let!(:records_to_find) do #records que deve ser encontrado
        #vai receber a factory como parametro
    (0..3).to_a.map { |index| create(factory_name, name: "Example #{index}") } #mapeia para array 
  end

    let!(:records_to_ignore) { create_list(factory_name, 3) } # listagem de coisas que devem ser ignoradas
      
    #tests

    it "Found records with expression in :name" do
      found_records = described_class.search_by_name(search_params)
      expect(found_records.to_a).to contain_exactly(*records_to_find)
    end

    it "Ignores records without expression in :name" do 
      found_records = described_class.search_by_name(search_params)
      expect(found_records.to_a).to_not include(*records_to_ignore)
    end
     
end
