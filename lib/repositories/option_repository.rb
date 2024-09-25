require_relative "base_repository"

class OptionRepository < BaseRepository
  def self.repo
    @repo ||= new
  end

  def where(rental_id:)
    all.select { |item| item.rental_id == rental_id }
  end
end
