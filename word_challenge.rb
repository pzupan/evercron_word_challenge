#!/usr/bin/env ruby

class WordChallenge

  def initialize(file)
    @dictionary = []
    @sequences = []
    @words = []
    read_file(file)
  end

  def dictionary
    @dictionary
  end

  def sequences
    @sequences
  end

  def words
    @words
  end

  def unique_sequence?(sequence, word)
    @dictionary.rindex{ |w| w.include?(sequence) && w != word }.nil?
  end 

  def parse_sequences
    @dictionary.each do |word|
      variations = word.length-3
      variations.times do |i|
        sequence = word.slice(i, 4)
        if unique_sequence?(sequence, word)
          @sequences << sequence
          @words << word
        end
      end
    end
    
  end

  def write_file(content, file)
    File.open(file, "w+") do |f|
      f.puts(content)
    end
  end

  private

  def read_file(file)
    File.readlines(file).each do |line|
      # remove non-letters
      line.gsub!(/\W+/, '')
      if line.length > 3
        # use only lower case in dictionary
        @dictionary << line.downcase
      end
    end
  end

end

# wc = WordChallenge.new('test2.txt')
# wc.parse_sequences
# wc.write_file(wc.sequences, 'sequences.txt')
# wc.write_file(wc.words, 'words.txt')
