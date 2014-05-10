require "svg_rails/version"
require "svg_rails/helper"
require "svg_rails/railtie"
require "svg_rails/configuration"

module SvgRails

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.reset
    @configuration = Configuration.new
  end

end