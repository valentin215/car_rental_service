require_relative "base_repository"

class CarRepository < BaseRepository
  def self.repo
    @repo ||= new
  end

  def find(id)
    all.find { |item| item.id == id }
  end
end
