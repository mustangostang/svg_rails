# SVG for Rails

## Images

There are two sensible defaults to use SVG. If you use it as a static image, the easiest way is to use it as a image `src`.

    = svg_image_tag "chanel.svg", "/no-svg/chanel.png"

If you need interactivity and dynamic styling, use the `object` syntax:

    = svg_object_tag "chanel.svg", "/no-svg/chanel.png"

## CSS

If you're not using Modernizr to detect for no-svg/no-inline-svg, add to your `application.js`:

    //= require detect-no-svg

Then you can use:

    .bg-basic {
      
    }

    .bg-with-absolute-fallback {
      background: svg("chanel.svg", "/no-svg/chanel.png") no-repeat top left;
    }

## Configuration

Instead of using absolute urls all the time, you can set the configuration directory for no-svg fallbacks:

    SvgRails.configure.do |config|
      config.assets_path_for_nosvg = 'no-svg'
      # HTML:
      # = svg_image_tag "chanel.svg", "chanel.png"
      # = svg_image_tag "chanel.svg", :auto
      # CSS
      # background: svg("chanel.png", auto) no-repeat top left;
      # background: svg("chanel.svg", auto) no-repeat top left;
    end



You can loo

## Installation

Add this line to your application's Gemfile:

    gem 'svg_rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install svg_rails

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( http://github.com/<my-github-username>/svg_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
