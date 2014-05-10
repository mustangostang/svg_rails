require "spec_helper"
require "svg_rails"

class FakeView < ActionView::Base
  include SvgRails::Helper
end

describe SvgRails::Helper do
  it "ouputs correct HTML for images without fallback" do
    FakeView.new.svg_image_tag("icon.svg", "/images/icon.png").should == '<img onerror="this.src=\'/images/icon.png\'" src="/images/icon.svg" />'
    FakeView.new.svg_image_tag("icon.svg", "icon.png").should == '<img onerror="this.src=\'/images/no-svg/icon.png\'" src="/images/icon.svg" />'
  end
end