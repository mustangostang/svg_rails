require "action_view"

module SvgTag
  module Helper
    include ActionView::Helpers::AssetTagHelper

    # Returns an HTML embed tag for the SVG +source+. The +source+ can be a full
    # path or a file.
    #
    # ==== Options
    #
    # You can add HTML attributes using the +options+. The +options+ supports
    # additional key for convenience and conformance:
    #
    # * <tt>:size</tt> - Supplied as "{Width}x{Height}" or "{Number}", so "30x45" becomes
    #   width="30" and height="45", and "50" becomes width="50" and height="50".
    #   <tt>:size</tt> will be ignored if the value is not in the correct format.
    #
    # The default value for :type is <tt>"image/svg+xml"</tt>
    #
    # ==== Examples
    #
    #   svg_tag("icon")
    #   # => <object><embed src="/images/icon" type="image/svg+xml" /></object>
    #   svg_tag("icon.svg")
    #   # => <object><embed src="/images/icon.svg" type="image/svg+xml" /></object>
    #   svg_tag("icon.svg", size: "16x10")
    #   # => <object><embed type="image/svg+xml" src="/images/icon.svg" width="16" height="10" /></object>
    #   svg_tag("/icons/icon.svg", size: "16")
    #   # => <object><embed type="image/svg+xml" src="/icons/icon.svg" width="16" height="16" /></object>
    #   svg_tag("/icons/icon.svg", height: '32', width: '32')
    #   # => <object><embed type="image/svg+xml" height="32" src="/icons/icon.svg" width="32" /></object>
    #   svg_tag("/icons/icon.svg", class: "menu_icon")
    #   # => <object><embed type="image/svg+xml" class="menu_icon" src="/icons/icon.svg" /></object>
    def svg_tag(source, options={})
      options = options.symbolize_keys

      options[:src] = path_to_image(source)

      options[:type] = options.fetch(:type){ "image/svg+xml" }

      options[:width], options[:height] = extract_dimensions(options.delete(:size)) if options[:size]

      content_tag("object") do
        tag("embed", options)
      end

    end

    private

    def extract_dimensions(size)
      if size =~ %r{\A\d+x\d+\z}
        size.split('x')
      elsif size =~ %r{\A\d+\z}
        [size, size]
      end
    end

  end
end