require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name= nil, artist_name = nil)
    @name = name
    @artist_name = artist_name 
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name = nil, artist_name = nil)
  	song = self.new
  	song.name = name
  	song.artist_name = artist_name
  	song.save
  	song
  end

  def self.new_by_name(name)
  	song = self.new
  	song.name = name
  	song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find do |x|
      x.name == name
    end
  end

  def self.find_or_create_by_name(name)
    finding = self.find_by_name(name)
    if finding == nil
        self.create_by_name(name)
    else
        finding
    end
  end 

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    artist, songname = filename.split (' - ')
    songname = songname.split(".")[0]
    song = self.new(songname, artist)
    song 
  	
  end
  
  def self.create_from_filename(filename)
    artist, songname = filename.split (' - ')
    songname = songname.split(".")[0]
    song = self.create(songname, artist)
    song
  end

  def self.destroy_all
    @@all =[]
  end 
  


end
