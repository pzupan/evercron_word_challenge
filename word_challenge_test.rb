#!/usr/bin/env ruby

gem 'minitest', '>= 5.8.2'
require 'minitest/autorun'
require 'byebug'
require_relative 'word_challenge'

class WordChallengeTest < Minitest::Test

  def setup
    @wc = WordChallenge.new('test1.txt')
    @wc.parse_sequences
  end
  
  def test_wc_dictionary?
    assert_equal @wc.dictionary, %w(arrows carrots give)
  end

  def test_wc_sequences
    assert_equal @wc.sequences.sort, %w(carr give rots rows rrot rrow).sort
  end

  def test_wc_words
    assert_equal @wc.words.sort, %w(carrots give carrots arrows carrots arrows).sort
  end

  def test_sequence_word_order
    assert_equal @wc.sequences.index('give'), @wc.words.index('give')
  end

end