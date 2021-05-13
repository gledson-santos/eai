
Dado('que pesquiso pelo nome {string}') do |string|
  @nome = string
  @resultado = @usuario_api.consulta_nome(string)
  expect(@resultado.code).to eq(200)
end

Entao('eu valido a lista retornada com o nome') do
  result_json = JSON.parse(@resultado.body)
  @usuario_api.valida_nome_array(@nome, result_json['data'])
end

Dado('que eu busco a lista de usuários') do
  step %{que pesquiso pelo nome " "}
end

Dado('faço a pesquisa pelo primeiro id') do
  result_json = JSON.parse(@resultado.body)
  @id = result_json['data'][0]['id']
end

Entao('eu valido a lista retornada') do
  @result_id = @usuario_api.consulta_id(@id)
  expect(@result_id.code).to eq(200)
  id_result_json = JSON.parse(@result_id.body)
  chave_objeto = ["id", "user_id", "title", "body", "created_at", "updated_at"]
  expect(id_result_json['data'][0].keys).to match_array(chave_objeto)
end
