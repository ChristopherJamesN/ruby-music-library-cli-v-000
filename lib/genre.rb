class Genre
  attr_accessor :name
  @@all=[]


  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def name
    @name
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.genre == nil
      song.genre = self
    end
  end

  def artists
    artists_array = []
    self.songs.each do |song|
      if artists_array.include?(song.artist) == false
        artists_array.push(song.artist)
      end
    end
    artists_array
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all=[]
  end

  def save
    @@all.push(self)
  end

  def self.create(name)
    Genre.new(name).save[0]
  end

end
