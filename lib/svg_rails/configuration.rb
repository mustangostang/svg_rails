module SvgRails

  class Configuration
    attr_accessor :assets_path_for_nosvg
    attr_accessor :auto_find_assets

    def initialize
      @assets_path_for_nosvg = 'no-svg'
      @auto_find_assets      = false
    end

  end

end