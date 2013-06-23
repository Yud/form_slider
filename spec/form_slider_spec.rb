# encoding: utf-8

require 'spec_helper'

describe FormSlider do
  include ActionView::Helpers
  include FormSlider::ApplicationHelperAdditions
  include FormSlider::SliderFormBuilder

  context "slider_field_tag" do
    before(:each) do
      @template = ActionView::Base.new
      @template.output_buffer = ''
      @slider_html = @template.slider_field_tag(:wolf, 4, min: 1, max: 10, color: 'red')
    end

    it "generates expected html" do
      @slider_html == "<div class=\"slider-container\"><label>wolf</label><div class=\"slider\" data-color=\"green\" data-max=\"10\" data-min=\"1\"></div><input id=\"wolf\" name=\"wolf\" type=\"text\" value=\"4\" /></div>"
    end

    it "generates a container div for the slider field" do
      html = Nokogiri::HTML(@slider_html)
      html.css('.slider-container').children.css('label').should_not be_blank
      html.css('.slider-container').children.css('input#wolf').should_not be_blank
    end

    it "creates a label" do
      @slider_html.should match('<label>wolf</label>')
    end

    it "generates a text input with the given value and name" do
      @slider_html.should match('<input id="wolf" name="wolf" type="text" value="4" />')
    end

    it "it creates a slider div with the appropriate data attributes" do
      html = Nokogiri::HTML(@slider_html)
      html.at_css('.slider')["data-min"].should == "1"
      html.at_css('.slider')["data-max"].should == "10"
      html.at_css('.slider')["data-color"].should == "red"
    end
  end

  context "slider_form_builder" do
    before(:each) do
      @template = ActionView::Base.new
      @template.output_buffer = ''
      @builder = FormSlider::SliderFormBuilder::SliderFormForBuilder.new(:item, Film.new(director: 'Francis Ford Coppola', title: 'The Conversation', rating: 10), @template, {})
    end

    it "generates expected html" do
      @builder.slider_field(:rating) == "<div class=\"slider-container\"><label>rating</label><div class=\"slider\" data-color=\"green\" data-max=\"10\" data-min=\"1\"></div><input id=\"item_rating\" name=\"item[rating]\" type=\"text\" value=\"10\" /></div>"
    end
  end
end
