require 'rails'
require 'svg_rails/helper'

module SvgRails
  class Railtie < Rails::Railtie
    initializer "svg_rails.action_view" do
      ActiveSupport.on_load(:action_view) do
        include SvgRails::Helper
      end
    end
  end
end