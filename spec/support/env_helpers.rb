module EnvHelpers
  def use_env_variables(variables)
    original_variables = {}
    variables.each do |key, val|
      original_variables[key] = ENV.fetch(key, nil)
      ENV[key] = val
    end

    yield

    original_variables.each { |key, val| ENV[key] = val }
  end
end
