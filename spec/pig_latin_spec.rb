require 'rspec'
require_relative '../lib/pig_latin.rb'

describe PigLatinTranslation do

  def pig_latin(phrase)
    return PigLatinTranslation.new(phrase).translate
  end

  it 'should translate words that begin with consonant' do
    expect(pig_latin('duck')).to eql("uckday")
  end

  it 'should translate a phrase' do
    expect(pig_latin('duck egg muffin')).to eql("uckday eggway uffinmay")
  end

  it 'should translate words that begin with a cluster of consonants' do
    expect(pig_latin("dd")).to eql("dday")
  end

  it 'should translate words that begin with vowels' do
    expect(pig_latin("egg")).to eq("eggway")
  end

end
