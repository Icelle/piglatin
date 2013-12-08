require 'pry'

class PigLatinTranslation

  attr_reader :phrase, :words
  VOWELS = /a|e|i|o|u/

  def initialize(phrase)
    @phrase = phrase  #put put phrase in [] and split each word so i can sort later
    @words  = words
  end

  # @return [String] translated phrase in pig latin
  def translate
    translated_words = []
    @words.each do |word|
      if starts_with_vowel?(word) #"egg" → "eggway"
        translated_words << "#{word}way"
      else  #"happy" → "appyhay"
        # move first consonant to the end immediately
        translated_word = word[1..-1]+word[0]
        i = 1
        # iterate through all letters in 'word' starting with the second letter until the end or we find a vowel, whichever is first
        while i < word.length && !starts_with_vowel?(word[i])
          i += 1
          translated_word = translated_word[1..-1] + translated_word[0]
        end
        translated_words << translated_word+"ay"
      end
    end
    return translated_words.join(' ')
  end

  private
  def words #want to iterate through each word in @phrase array
    @phrase.split
  end

  def starts_with_vowel?(word)
    if word[0].match(VOWELS)
      return true
    else
      return false
    end
  end
end



