require 'yaml'

class NumberMapper
  def word_exists?(word)
    word.upcase!
    searched_word = dictionary_words.bsearch do |dictionary_word|
      dictionary_word >= word
    end
    searched_word == word
  end

  # Maping of number with letters
  def digit_mapping
    @digit_mapping ||= YAML.safe_load(File.read("#{__dir__}/digit_mapping.yml"))
  end

  private

  def dictionary_words
    @dictionary_words ||= File.readlines('lib/dictionary.txt').map(&:strip)
  end
end
