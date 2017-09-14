class Artist

  attr_accessor :name
  @@all = []


  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
    @genres = []
  end

  def name
    @name
  end

  def songs
    @songs
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.artist == nil
      song.artist=self
    end
  end

  def add_song_by_name(name)
    song = Song.new(name)
    @songs << song
    song.artist = self
  end

  def save
    @@all.push(self)
  end

  def self.all
    @@all
  end

  def print_songs
    @songs.each do |song|
      puts "#{song.name}"
    end
  end

  def self.destroy_all
    @@all=[]
  end

  def self.create(name)
    Artist.new(name).save[0]
  end

  def genres
    self.songs.each do |song|
      if @genres.include?(song.genre) == false
        @genres.push(song.genre)
      end
    end
    @genres
  end

end
