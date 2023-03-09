require 'ruby_gpt'

class RubyGPTTest
  include RubyGPT
end

test = RubyGPTTest.new
# test.hello_world()
result = test.current_temperature_in("vienna")
# result = test.execute_javascript("console.log(1);");
puts "RESULT: #{result}"
exit
