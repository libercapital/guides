# Tratamento de Erros

## rescue_handler

Para mostrar o erro de um worker no Sentry e nos logs, mas não considerar a execução um erro no Sidekiq, use `rescue_handler`. (Cuidado, porque isto poderá tornar as métricas imprecisas.) Ex.:

```rb
class FooWorker
  include ErrorHandler::DefaultHandler
  include Sidekiq::Status::Worker
  include Sidekiq::Worker

  sidekiq_options queue: 'foo'
  # sidekiq_options retry: 3

  def perform(param_1, param_2)
    # ...
  rescue StandardError => e
    context = {
      param_1: param_1,
      param_2: param_2
    }

    rescue_handler(e, context)
    # ...
  end
end
```

## rescue_handler_and_raise

Para mostrar o erro de um worker no Sentry, nos logs e considerar o job um erro no Sidekiq, use `rescue_handler_and_raise`. Ex.:

```rb
class FooWorker
  include ErrorHandler::DefaultHandler
  include Sidekiq::Status::Worker
  include Sidekiq::Worker

  sidekiq_options queue: 'foo'
  # sidekiq_options retry: 3

  def perform(param_1, param_2)
    # ...
  rescue StandardError => e
    context = {
      param_1: param_1,
      param_2: param_2
    }

    rescue_handler_and_raise(e, context)
    # equivalente a:
    # # rescue_handler(e, context)
    # # raise(e)
  end
end
```

Por padrão, essa abordagem permitirá o retry manual do job no painel do Sidekiq. Caso não queira, use a [opção `dead: false`](https://github.com/mperham/sidekiq/wiki/Error-Handling#:~:text=You%20can%20disable%20a%20job%20going%20to%20the%20Dead%20set).
