require "spec_helper"
require "svg_rails/helper"

class FakeView < ActionView::Base
  include SvgRails::Helper
end

describe SvgRails::Helper do
  it "ouputs correct HTML for images without fallback" do
    FakeView.new.svg_image_tag("icon.svg").should == '<img src="/images/icon.svg" />'
    FakeView.new.svg_image_tag("icon.svg", size: "16x10").should == '<img height="10" src="/images/icon.svg" width="16" />'
    FakeView.new.svg_image_tag("icon.svg", size: "16").should == '<img height="16" src="/images/icon.svg" width="16" />'
    FakeView.new.svg_image_tag("icon.svg", height: '32', width: '32').should == '<img height="32" src="/images/icon.svg" width="32" />'
    FakeView.new.svg_image_tag("icon.svg", class: "menu_icon").should == '<img class="menu_icon" src="/images/icon.svg" />'
  end
end