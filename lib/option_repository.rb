class OptionRepository
  def self.repo
    @repo ||= new
  end

  def initialize
    @options = []
  end

  attr_accessor :options

  def where(rental_id:)
    options.select { |option| option.rental_id == rental_id }
  end
end
