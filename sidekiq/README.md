# Sidekiq

- Prefer to place workers in the `/app/workers` folder
- Prefer to follow the [Sidekiq Best Practices](https://github.com/mperham/sidekiq/wiki/Best-Practices)
- Use `raise` on the `perform` method to tell Sidekiq that a job has failed when using `rescue` or `Result`
- Prefer to log the `error` message and `backtrace` on rescue, to help debugging

## Queues

- Prefer to define worker queue as `critical`, `default` or `low`, based on job proiority

## Status

- Use [sidekiq-status](https://github.com/utgarda/sidekiq-status) if you wanna track job status adding `include Sidekiq::Status::Worker` to the worker
