Gem::Specification.new do |spec|
  spec.name          = "ruby_gpt"
  spec.version       = "0.1.0"
  spec.authors       = ["silvio doblhofer"]
  spec.email         = ["silvio.doblhofer@gmail.com"]
  spec.summary       = "Ruby gem for dynamically generating method implementations using OpenAI's GPT-3 API"
  spec.description   = "Ruby gem that includes the ChatGPT class with the method_missing implementation that dynamically generates missing method implementations using OpenAI's GPT-3 API."
  spec.homepage      = "https://github.com/sido378/ruby_gpt"
  spec.license       = "MIT"

  spec.files         = [
    "lib/ruby_gpt.rb"
  ]

  spec.add_dependency "openai"
end
