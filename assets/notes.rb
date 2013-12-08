require 'pry'
class String
  attr_reader :phrase
  VOWELS = /a|e|i|o|u/

  # @return [String] translated phrase in pig latin
  def translate
    translated_words = []
    self.split.each do |word|
      if starts_with_vowel?(self) #"egg" → "eggway"
        translated_words << "#{word}way"
      else  #"happy" → "appyhay"
        # move first consonant to the end immediately
        translated_word = word[1..-1]+word[0]
        i = 1
        # iterate through all letters in 'word' starting with the second letter until the end or we find a vowel, whichever is first
        while !starts_with_vowel?(self[i]) && i < word.length
          i += 1
          translated_word = translated_word[1..-1] + translated_word[0]
        end
        translated_words << translated_word+"ay"
      end
    end
    return translated_words
  end

  def starts_with_vowel?(word)
    if word[0].match(VOWELS)
      return true
    else
      return false
    end
  end
end
