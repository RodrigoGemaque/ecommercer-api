module RequestAPI
    
	def body_json (symbolize_keys: false) 			
		json = JSON.parse(response.body) #esse response.body vem da chamada do rspec	
		#caso o symbolize venha como true
		symbolize_keys ? json.deep_symbolize_keys : json # transfoma a string que vier como simbolo
	rescue
		return {}
	end	

	 def auth_header(user = nil, merge_with: {}) 
			user ||= create(:user) # caso o user esteja vazio chama a factory de criação 
			auth = user.create_new_auth_token # método do divise, 
			header = auth.merge({ 'Content-Type' => 'application/json', 'Accept'=> 'application/json' }) # mostrando para api que a comunição é em json
			header.merge merge_with
		end
end

RSpec.configure do |config|
  config.include RequestAPI, type: :request
end