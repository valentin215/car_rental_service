class BaseRepository
  def initialize
    @items = []
  end

  def all
    @items
  end

  attr_writer :items
end
