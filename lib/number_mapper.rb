require 'yaml'

class NumberMapper
  attr_accessor :word_combinations

  def search_word_combinations(number)
    self.word_combinations = []
    search_words(number.to_s)
    word_combinations
  end

  def word_exists?(word)
    word.upcase!
    searched_word = dictionary_words.bsearch do |dictionary_word|
      dictionary_word >= word
    end
    searched_word == word
  end

  private

  def search_words(number, words = '')
    digit = number[0].to_i
    number = number[1..-1]
    digit_mapping[digit].each do |char|
      new_words = words + char
      last_word = new_words.split(',').last
      if (last_word.length > 2) && word_exists?(last_word)
        if number.empty?
          word_combinations << new_words
        else
          search_words(number, new_words) unless number.empty?
          new_words += ','
        end
      end
      search_words(number, new_words) unless number.empty?
    end
  end

  # Maping of number with letters
  def digit_mapping
    @digit_mapping ||= YAML.safe_load(File.read("#{__dir__}/digit_mapping.yml"))
  end

  def dictionary_words
    @dictionary_words ||= File.readlines('lib/dictionary.txt').map(&:strip)
  end
end
