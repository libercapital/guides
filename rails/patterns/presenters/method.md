# Presenters

Conforme enquete na backguilda de 29/07/2022
https://libercapital.slack.com/archives/C015L23UF43/p1659115703666959?thread_ts=1659114080.737939&cid=C015L23UF43

O padrão para chamada dos presenters é de `.call`

Exemplo: `FooPresenter.new(foo).call`

```rb
class FooPresenter < ActiveModel::Serializer
  def initialize(foo:)
    super
    @foo = foo
  end

  def call
    # ...
  end

  private

  attr_reader :foo

  # ...
end
```