require 'rails'
require 'svg_tag/helper'

module SvgTag
  class Railtie < Rails::Railtie
    initializer "svg_tag.action_view" do
      ActiveSupport.on_load(:action_view) do
        include SvgTag::Helper
      end
    end
  end
end