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
      @builder = FormSlider::SliderFormBuilder::SliderFormForBuilder.new(:item, Film.new(director: 'Francis Ford Coppola', title: 'The Conversation', rating: 10), @template, {})
    end

    it "generates expected html" do
      @builder.slider_input(:rating) == "<div class=\"slider-container\"><label>rating</label><div class=\"slider\" data-color=\"green\" data-max=\"10\" data-min=\"1\"></div><input id=\"item_rating\" name=\"item[rating]\" type=\"text\" value=\"10\" /></div>"
    end
  end
end
