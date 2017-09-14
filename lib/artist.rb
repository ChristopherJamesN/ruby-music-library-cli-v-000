class Artist

  attr_accessor :name
  @@all = []


  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
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
    @@song_count += 1
  end

  def self.song_count
    @@song_count
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
    genre_array = []
    self.songs.each do |song|
      if genre_array.include?(song.genre) == false
        genre_array.push(song.genre)
      end
    end
    genre_array
  end

end
