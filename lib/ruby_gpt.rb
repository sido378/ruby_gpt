require 'openai'

module RubyGPT
  class ChatGPT
    def self.method_missing(method_name, *args, &block)
      prompt = "Implement a method called '#{method_name}' that takes #{args.length} arguments"
      prompt += " with argument types #{args.map(&:class).map(&:to_s).join(', ')}" unless args.empty?
      response = OpenAI::Completion.create(
        engine: 'text-davinci-002',
        prompt: prompt,
        max_tokens: 1024,
        n: 1,
        stop: '###'
      )
      response.choices[0].text.gsub('Implemented method:', '').strip
    end
  end
end
