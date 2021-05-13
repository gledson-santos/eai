
class Usuario_Api
  include HTTParty
  include RSpec::Matchers
  #@TODO: Ajustar essa variavel para pegar a url do config
  base_uri "https://gorest.co.in"

  def initialize
    @header = {'accept':'application/json', 'content-type': 'application/json'}
  end

  def consulta_nome(nome)
    self.class.get("/public-api/users?name=#{nome}", @header)
  end

  def consulta_id(id)
    self.class.get("/public-api/users/#{id}/posts", @header)
  end

  def valida_nome_array(nome, array)
    array.each do |valor|
      expect(valor['name']).to include(nome)
    end
  end

end
