require "spec_helper"
require "svg_rails"

class FakeView < ActionView::Base
  include SvgRails::Helper
end

describe SvgRails::Helper do
  it "ouputs correct HTML for objects with fallback" do
    FakeView.new.svg_object_tag("icon.svg", "/images/icon.png").should == '<object data="/images/icon.svg" type="image/svg+xml"><param name="src" value="/images/icon.svg" /><img alt="Icon" src="/images/icon.png" /></object>'
    FakeView.new.svg_object_tag("icon.svg", "icon.png").should == '<object data="/images/icon.svg" type="image/svg+xml"><param name="src" value="/images/icon.svg" /><img alt="Icon" src="/images/no-svg/icon.png" /></object>'
  end
end