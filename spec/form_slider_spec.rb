# encoding: utf-8

require 'spec_helper'

describe FormSlider do
  include ActionView::Helpers
  include FormSlider::ApplicationHelperAdditions
  include FormSlider::SliderFormBuilder

  context "slider_input_tag" do
    before(:each) do
      @template = ActionView::Base.new
      @template.output_buffer = ''
    end

    it "generates expected html" do
      @template.slider_input_tag(:wolf, 4) == "<div class=\"slider-container\"><label>wolf</label><div class=\"slider\" data-color=\"green\" data-max=\"10\" data-min=\"1\"></div><input id=\"wolf\" name=\"wolf\" type=\"text\" value=\"4\" /></div>"
    end
  end

  context "slider_form_builder" do
    before(:each) do
      @template = ActionView::Base.new
      @template.output_buffer = ''
      @builder = FormSlider::SliderFormBuilder::SliderFormForBuilder.new(:item, Object.new, @template, {})
    end

    it "tests stuff" do
      @builder.slider_input(:wolf)
    end
  end
end
