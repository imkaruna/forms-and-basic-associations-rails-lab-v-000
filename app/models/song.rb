class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    artist.try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end


  def genre_name
    genre.try(:name)
  end

  def genre_id=(id)
    self.genre = Genre.find_by(id: id)
  end

  def song_notes= (contents)
  	contents.each do |content|
  		self.notes << Note.create(content: content)
  	end
  end

  def note_contents
  	self.notes.map {|note| note.content}
  end


end
