require 'rest-client'
require 'json'

# Cliente para interagir com a API de Problemas
class ProblemClient
  BASE_URL = 'http://localhost:3000/problems'

  # Cria um novo problema na API
  def self.create(title, description)
    response = RestClient.post(BASE_URL, { problem: { title: title, description: description } })
    puts response.body
  end

  # Lê um problema existente na API
  def self.read(id)
    response = RestClient.get("#{BASE_URL}/#{id}")
    puts response.body
  end

  # Atualiza um problema existente na API
  def self.update(id, title, description)
    response = RestClient.put("#{BASE_URL}/#{id}", { problem: { title: title, description: description } })
    puts response.body
  end

  # Exclui um problema existente na API
  def self.delete(id)
    RestClient.delete("#{BASE_URL}/#{id}")
    puts "Problem with ID #{id} deleted successfully."
  end
end

# Exemplo de uso
# Criar um novo problema
ProblemClient.create('Title', 'Problem Description')

# Ler um problema existente
ProblemClient.read(1)

# Atualizar um problema existente
ProblemClient.update(1, 'New Title', 'New description')

# Excluir um problema existente
ProblemClient.delete(1)
