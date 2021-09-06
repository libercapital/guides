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
