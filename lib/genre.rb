class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name

   @@all = []

   def initialize(name)
    @name = name
    @songs = []
    save
   end

   def self.all 
    @@all
   end

   def self.destroy_all
    @@all.clear
   end

   def save
     @@all << self
   end

   def songs
     @songs
   end

   def artists
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end

   def self.create(name)
     self.new(name)
   end

   def add_song(song)
     song.genre = self unless song.genre == self
     @songs << song unless @songs.include?(song)
   end
end