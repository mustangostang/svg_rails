require "spec_helper"
require "svg_rails"
require "svg_rails/configuration"

class FakeView < ActionView::Base
  include SvgRails::Helper
end

describe SvgRails do
  describe '#configure' do
    it "returns correct path for assets" do
      SvgRails.configuration.assets_path_for_nosvg = "some-other-path"
      FakeView.new.svg_image_tag("icon.svg", "icon.png").should == '<img onerror="this.src=\'/images/some-other-path/icon.png\'" src="/images/icon.svg" />'
      FakeView.new.svg_image_tag("icon.svg", "/images/old-path/icon.png").should == '<img onerror="this.src=\'/images/old-path/icon.png\'" src="/images/icon.svg" />'
    end

    it "returns correct path for assets" do
      SvgRails.configuration.auto_find_assets = true
      FakeView.new.svg_image_tag("icon.svg").should == '<img onerror="this.src=\'/images/no-svg/icon.png\'" src="/images/icon.svg" />'
      FakeView.new.svg_image_tag("icon.svg", :skip).should == '<img src="/images/icon.svg" />'
      FakeView.new.svg_image_tag("icon.svg", "/images/old-path/icon.png").should == '<img onerror="this.src=\'/images/old-path/icon.png\'" src="/images/icon.svg" />'
    end

    after :each do
      SvgRails.reset
    end

  end
end