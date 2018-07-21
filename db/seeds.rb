require 'rest-client'
require 'json'
require 'net/http'
require 'active_support'
require 'active_support/core_ext'

def confirm_string(str)
  str[/[a-zA-Z]+/] == str
end

def json_dictionary
  dictionary = File.read('db/dictionary.json')
  d = JSON.parse(dictionary)
  part = Hash[d.to_a[294001,98000]]
end

def get_frequency(word)
  link = "http://api.datamuse.com/words?sp=#{word}&md=f&max=1"
  data ={}
  raw_data = RestClient.get(link)
  data = JSON.parse(raw_data)
  if (data != [])
    frequency = data[0]['tags'][0].split("f:")[1].to_f
  else
    return 0
  end
end

def generate_hash_with_remaining_words(dictionary)
  last_word = "unwrote"
  dictionary_array = dictionary.to_a
  dictionary_array.each do |w_a|
    if w_a[0] === last_word
      index_of_last_word = dictionary_array.index(w_a)
      return remaining_array = dictionary_array.slice((index_of_last_word+1)..dictionary_array.count).to_h
    end
  end
end

def seed_dictionary
  dictionary = json_dictionary
  remaining_words = generate_hash_with_remaining_words(dictionary)
  remaining_words.each do |word, value|
    freq = get_frequency(word)
    puts "Checking if #{word} meets the criteria"
    if (word.length > 3) && (confirm_string(word)) && (freq > 28)
      Word.create(word: word.to_s, length: word.length, frequency: freq)
    end
  end
end

seed_dictionary
