require 'yaml'

class NumberMapper
  attr_accessor :word_combinations, :errors, :number

  def initialize(attrs = {})
    self.errors = {}
    self.word_combinations = []
    self.number = attrs[:number].to_s
  end

  def search_word_combinations
    if valid_number?
      search_words(number)
      word_combinations
    else
      errors[:number]
    end
  end

  def word_exists?(word)
    word.upcase!
    searched_word = dictionary_words.bsearch do |dictionary_word|
      dictionary_word >= word
    end
    searched_word == word
  end

  def valid_number?
    error_message = if number.empty?
                      'Number should not be blank.'
                    elsif !(/^\d*$/ =~ number)
                      'Number should contain only Digits.'
                    elsif !only_allowed_digits_included?
                      "Number should contain Digits(#{allowed_digits.join(', ')}) mapped with Alphabets."
                    end
    errors[:number] = error_message unless error_message.nil?
    errors.empty?
  end

  private

  def search_words(number_section, words = '')
    digit = number_section[0].to_i
    number_section = number_section[1..-1]
    digit_mapping[digit].each do |char|
      new_words = words + char
      last_word = new_words.split(',').last
      if (last_word.length > 2) && word_exists?(last_word)
        if number_section.empty?
          word_combinations << new_words
        else
          search_words(number_section, new_words) unless number_section.empty?
          new_words += ','
        end
      end
      search_words(number_section, new_words) unless number_section.empty?
    end
  end

  # Maping of number with letters
  def digit_mapping
    @digit_mapping ||= YAML.safe_load(File.read("#{__dir__}/digit_mapping.yml"))
  end

  def dictionary_words
    @dictionary_words ||= File.readlines('lib/dictionary.txt').map(&:strip)
  end

  def only_allowed_digits_included?
    (number.chars.map(&:to_i) - allowed_digits).empty?
  end

  def allowed_digits
    digit_mapping.keys
  end
end
