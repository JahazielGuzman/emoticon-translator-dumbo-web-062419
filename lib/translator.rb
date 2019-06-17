# require modules here
require "yaml"

def load_library(path)
  # code goes here
  trans = {"get_meaning" => {}, "get_emoticon" => {}}
  emo = YAML.load_file(path)
 
 	# first emotes elem is english emoticon, 2nd is japanese
	emo.each do |meaning, emotes|
		trans["get_meaning"][emotes[1]] = meaning
		trans["get_emoticon"][emotes[0]] = emotes[1]
	end

	trans
end

def get_japanese_emoticon(path, english)
  # code goes here
  emotes = load_library path
  sorry_message = "Sorry, that emoticon was not found"
  emotes["get_emoticon"][english] ? emotes["get_emoticon"][english] : sorry_message
end

def get_english_meaning(path, japanese)
  # code goes here
  emotes = load_library path
  sorry_message = "Sorry, that emoticon was not found"
  emotes["get_meaning"][japanese] ? emotes["get_meaning"][japanese] : sorry_message
end