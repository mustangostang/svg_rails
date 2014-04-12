require "spec_helper"
require "svg_tag/helper"

class FakeView < ActionView::Base
  include SvgTag::Helper
end

describe SvgTag::Helper do
  it "ouputs correct HTML" do
    FakeView.new.svg_tag("icon.svg").should == '<object><embed src="/images/icon.svg" type="image/svg+xml" /></object>'
    FakeView.new.svg_tag("icon.svg", size: "16x10").should == '<object><embed height="10" src="/images/icon.svg" type="image/svg+xml" width="16" /></object>'
    FakeView.new.svg_tag("/icons/icon.svg", size: "16").should == '<object><embed height="16" src="/icons/icon.svg" type="image/svg+xml" width="16" /></object>'
    FakeView.new.svg_tag("/icons/icon.svg", height: '32', width: '32').should == '<object><embed height="32" src="/icons/icon.svg" type="image/svg+xml" width="32" /></object>'
    FakeView.new.svg_tag("/icons/icon.svg", class: "menu_icon").should == '<object><embed class="menu_icon" src="/icons/icon.svg" type="image/svg+xml" /></object>'
  end
end