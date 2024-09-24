# frozen_string_literal: true

class Factory
  def self.build(data)
    data.map { build_item(_1) }
  end

  def self.build_item(item)
    raise NotImplementedError, "Subclasses must implement the build_item method"
  end
end
