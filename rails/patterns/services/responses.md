# Respostas de erro e sucesso para classes de serviços

Essa classe foi definida para lidar com as respostas dos serviços do monolito. A discussão iniciou-se por conta de que no monolito nós não possuíamos uma classe de respostas dos serviços bem definida e padronizada. A partir dessa discussão iniciada na back-guilda, decidimos explorar os problemas recorrentes e definir uma nova classe de respostas para as nossas classes de serviço que tenta abranger e resolver todos os nossos problemas atuais.

## O que a classe nova de respostas se propõe a resolver

- Ter uma chamada declarativa a fim de trazer clareza

- Ser dinâmica para resolver os casos comuns do monolito

- Ser o Jeito “Ruby” de programar(DRY)

- Pararmos de usar o OpenStruct deliberadamente no projeto do monolito

## Class definition

```Ruby
class Response < Struct.new(:success?, :data, :message, keyword_init: true)
  # Esses dois métodos continuaram aqui para serem retrocompativeis com os services de
  # responses mais antigos
  def error
    message unless success?
  end

  def error?
    !success?
  end
end
```

## Exemplos simples de uso

### Exemplo de sucesso

```Ruby
response = Response.new(
  success?: true,
  data: [1, 2, 3], # ids random de titulos(pode ser qualquer tipo de dado aqui)
  message: 'The service handled with the invoices'
)
# => #<struct Response :success?=true, data=[1, 2, 3], message="The service handled with the invoices">

response.success?
# => true
response.data
# => [1, 2, 3]
response.message
# => 'The service handled with the invoices'
response.error
# => nil
response.error?
# => false
```

### Exemplo de erro

```Ruby
response = Response.new(
  success?: false,
  data: 1, # id random de um titulo (can be any kind of data here)
  message: 'Some error happened inside the service'
)
# => #<struct Response :success?=false, data=1, message="Some error happened">

response.success?
# => false
response.data
# => 1
response.message
# => 'Some error happened'
response.error
# => 'Some error happened'
response.error?
# => true
```

