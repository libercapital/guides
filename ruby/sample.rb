module A
  class B
  end
end

def list_colors
  colors = ['cyan', 'magenta', 'yellow', 'key']

  colors.each_with_index do |color, index|
    puts "Color #{index} is #{color}"
  end
end

def log_error(error)
  Rails.logger.error("[#{self.class}] Error: #{error.message}")
end

class CircuitError < StandardError
  def initialize(message)
    super(message)
  end
end

class CircuitClosed < CircuitError
  def initialize
    super('The Circuit Breaker is closed')
  end
end

# bad
raise StandardError.new('The Circuit Breaker is closed')

# bad
raise 'The Circuit Breaker is closed'

# ok
raise CircuitError.new('The Circuit Breaker is closed')

# good
raise CircuitClosed.new

def validate_circuit_breaker(circuit_breaker)
  case circuit_breaker.status
    when 'open' then return circuit_breaker
    when 'closed' then fail CircuitClosed
    else
      fail CircuitError
  end
end

# bad
begin
  validate_circuit_breaker(circuit_breaker)
rescue CircuitError
  # do something
rescue CircuitClosed
  # do something else
end

def validate_circuit_breaker(circuit_breaker)
  circuit_breaker.status == 'open'
end

# good
if validate_circuit_breaker(circuit_breaker)
  # do something
else
  puts "The Circuit is invalid the Circuit Breaker is #{circuit_breaker.status}"
end
