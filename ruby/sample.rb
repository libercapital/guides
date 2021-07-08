module A
  class B
    def list_cmyk(index)
      colors = ['cyan', 'magenta', 'yellow', 'key']

      colors.each_with_index do |color, index|
        puts "Color #{index} is #{color}"
      end
    end
  end
end
