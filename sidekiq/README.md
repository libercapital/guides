# Sidekiq

- Prefer to place workers in the `/app/workers` folder
- Prefer to follow the [Sidekiq Best Practices](https://github.com/mperham/sidekiq/wiki/Best-Practices)
- Use `raise` on the `perform` method to tell Sidekiq that a job has failed when using `rescue` or `Result`
- Prefer to log the `error` message and `backtrace` on rescue, to help debugging

## Queues

- Prefer to define worker queue as `critical`, `default` or `low`, based on job proiority

## Status

- Use [sidekiq-status](https://github.com/utgarda/sidekiq-status) if you wanna track job status adding `include Sidekiq::Status::Worker` to the worker

## Testing

To test Sidekiq workers, prefer `Sidekiq::Testing.inline!` over `described_class.new.perform`.

`Sidekiq::Test.inline!` change objects into JSON, simulating a production worker call, while `described_class.new.perform` sends objects

Examples:

### <em>Bad</em>

```ruby
# frozen_string_literal: true

RSpec.describe(FooWorker) do
  describe '#perform' do
    context 'foo' do
      it 'bar' do
        expect { perform.new.perform }.to(change { foo }.from(nil).to(bar))
      end
    end
  end
end
```

### <em>Good</em>

```ruby
# frozen_string_literal: true

RSpec.describe(FooWorker) do
  describe '#perform' do
    context 'foo' do
      it 'bar' do
        Sidekiq::Testing.inline! do
          expect { described_class.perform_async }.to(change { foo }.from(nil).to(bar))
        end
      end
    end
  end
end
```
