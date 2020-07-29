require "pry"
class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(string)
    song = self.new
    song.name = string
    song
  end
  
  def self.create_by_name(string)
    song = self.create 
    song.name = string 
    song
  end
  
  def self.find_by_name(string)
    music = self.all.detect {|song| song.name == string}
  end
  
  def self.find_or_create_by_name(string)
    if music = self.find_by_name(string)
      music
    else
      self.create_by_name(string)
  end 
  end
  
  def self.alphabetical
    alpha = self.all.sort_by {|song| song.name}
    alpha
  end
  
  def self.new_from_filename(filename)
    
    song_list = filename.split(" - ")
    song_list[1] = song_list[1].chomp(".mp3")
    song = self.new
    song.name = song_list[1]
    song.artist_name = song_list[0]
    song 
  end
  
  def self.create_from_filename(filename)
    #binding.pry
    song_list = self.new_from_filename(filename)
    song = self.create
    song.name = song_list.name
    song.artist_name = song_list.artist_name
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end