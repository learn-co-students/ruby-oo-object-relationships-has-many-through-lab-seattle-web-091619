class Artist
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_song(song_name, genre)
    Song.new(song_name, self, genre)
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def genres
    # The songs method gives us an array of the artist's songs
    songs.map do |song|
      song.genre
    end
  end

  def self.all
    @@all
  end
end