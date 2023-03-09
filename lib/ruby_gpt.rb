require 'openai'

module RubyGPT
  def method_missing(method_name, *args, &block)
    prompt = "In Ruby, implement a method called '#{method_name}' that takes #{args.length} arguments"
    prompt += " with argument types #{args.map(&:class).map(&:to_s).join(', ')}" unless args.empty?
    prompt += " and returns the result"
    puts prompt
    openai_client = OpenAI::Client.new(api_key: ENV.fetch("OPENAI_API_KEY"), default_engine: "ada")
    response = openai_client.completions(
      engine: 'text-davinci-002',
      prompt: prompt,
      max_tokens: 1024,
      n: 1,
      stop: '###'
    )

    method_definition = response.choices[0].text.strip
    puts "RESPONSE???"
    puts response
    puts "#####"
    puts response.choices[0].text
    puts "RAW DEFINITION?"
    puts method_definition
    puts "######"
    if method_definition
      method_definition = method_definition.match(/(def\s+([a-zA-Z_]\w*)\s*((.*)\s*)*^end)/m)&.captures&.first&.strip
      if method_definition
        # method_definition = "#{method_definition}\nend"
        puts "!!!!!"
        puts method_definition
        puts "!!!!!"
        begin
          self.class.class_eval(method_definition)
          send(method_name, *args, &block)

        rescue => exception
          puts "Failed to generate a valid implementation for '#{method_name}'"
        end
      else
        puts "Failed to extract code block from '#{method_name}' method implementation"
      end
    else
      puts "Failed to generate method implementation for '#{method_name}'"
    end

    # # puts response
    # # puts "####"
    # method_implementation = response.choices[0].text.gsub('Implemented method:', '').strip
    # puts method_implementation
    # puts "????"
    # method_implementation = method_implementation.lines[1..].join("\n")
    # # puts "####"
    # # puts "method implementation??"
    # # puts method_implementation
    # # puts "###"
    # method_definition = "#{method_implementation}\nend"
    # # puts "METHOD DEFINITION?"
    # # puts "####"
    # puts method_definition
    # # puts "###"
    # # self.class.class_eval(method_implementation)
    # send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private = false)
    true
  end
end
