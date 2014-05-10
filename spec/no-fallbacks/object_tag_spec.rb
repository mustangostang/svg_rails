require "spec_helper"
require "svg_rails/helper"

class FakeView < ActionView::Base
  include SvgRails::Helper
end

describe SvgRails::Helper do
  it "ouputs correct HTML for objects without fallback" do
    FakeView.new.svg_object_tag("icon.svg").should == '<object data="/images/icon.svg" type="image/svg+xml"><param name="src" value="/images/icon.svg" /></object>'
    FakeView.new.svg_object_tag("icon.svg", size: "16x10").should == '<object data="/images/icon.svg" height="10" type="image/svg+xml" width="16"><param name="src" value="/images/icon.svg" /></object>'
    FakeView.new.svg_object_tag("icon.svg", size: "16").should == '<object data="/images/icon.svg" height="16" type="image/svg+xml" width="16"><param name="src" value="/images/icon.svg" /></object>'
    FakeView.new.svg_object_tag("icon.svg", height: '32', width: '32').should == '<object data="/images/icon.svg" height="32" type="image/svg+xml" width="32"><param name="src" value="/images/icon.svg" /></object>'
    FakeView.new.svg_object_tag("icon.svg", class: "menu_icon").should == '<object class="menu_icon" data="/images/icon.svg" type="image/svg+xml"><param name="src" value="/images/icon.svg" /></object>'
  end
end