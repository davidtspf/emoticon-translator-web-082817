# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  library = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(path).each do |file_meaning, file_array|
    english, japanese = file_array
    library["get_emoticon"][english] = japanese
    library["get_meaning"][japanese] = file_meaning
  end
  return library
end

def get_japanese_emoticon(path, english_emoji)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_emoticon"][english_emoji]
  if result
    result
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, japanese_emoji)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_meaning"][japanese_emoji]
  if result
    result
  else
    return "Sorry, that emoticon was not found"
  end
end
