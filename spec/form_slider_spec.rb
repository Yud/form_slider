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
      @slider_html = @template.slider_field_tag(:tickets, 4, min: 1, max: 10, color: 'red')
    end

    it "generates expected html" do
      @slider_html == 
        "<div class=\"slider-container\">
        <label>tickets</label>
        <div class=\"slider\" data-color=\"green\" data-max=\"10\" data-min=\"1\"></div>
        <input id=\"tickets\" name=\"tickets\" type=\"text\" value=\"4\" /></div>"
    end

    it "generates a container div for the slider field" do
      html = Nokogiri::HTML(@slider_html)
      html.css('.slider-container').children.css('label').should_not be_blank
      html.css('.slider-container').children.css('input#tickets').should_not be_blank
    end

    it "creates a label" do
      @slider_html.should match('<label>tickets</label>')
    end

    it "generates a text input with the given value and name" do
      @slider_html.should match('<input id="tickets" name="tickets" type="text" value="4" />')
    end

    it "generates a slider div with the appropriate data attributes" do
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
      @film = Film.new(director: 'Francis Ford Coppola', title: 'The Conversation', rating: 10)
      @builder = FormSlider::SliderFormBuilder::SliderFormForBuilder.new(:film,  @film, @template, {})
      @slider_html = @builder.slider_field(:rating, min: 1, max: 10, color: 'red')
    end

    it "generates expected html" do
      @builder.slider_field(:rating) == 
        "<div class=\"slider-container\">
        <label>rating</label>
        <div class=\"slider\" data-color=\"red\" data-max=\"10\" data-min=\"1\"></div>
        <input id=\"film_rating\" name=\"film[rating]\" type=\"text\" value=\"10\" /></div>"
    end

    it "generates a container div for the slider field" do
      html = Nokogiri::HTML(@slider_html)
      html.css('.slider-container').children.css('label').should_not be_blank
      html.css('.slider-container').children.css('input#film_rating').should_not be_blank
    end

    it "creates a label" do
      @slider_html.should match('<label>rating</label>')
    end

    it "generates a text input with the given value and name" do
      @slider_html.should match('<input id="film_rating" name="film\[rating\]" type="text" value="10" />')
    end

    it "generates a slider div with the appropriate data attributes" do
      html = Nokogiri::HTML(@slider_html)
      html.at_css('.slider')["data-min"].should == "1"
      html.at_css('.slider')["data-max"].should == "10"
      html.at_css('.slider')["data-color"].should == "red"
    end
  end
end
