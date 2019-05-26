require 'yaml'

class NumberMapper
  # Maping of number with letters
  def digit_mapping
    @digit_mapping ||= YAML.safe_load(File.read("#{__dir__}/digit_mapping.yml"))
  end
end
