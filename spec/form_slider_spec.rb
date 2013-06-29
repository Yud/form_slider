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
      @slider_html = @template.slider_field_tag(:tickets, 4, min: 1, max: 10, step: 1, color: 'red', value_display: '#value_display')
    end

    it "generates a container div for the slider field" do
      html = Nokogiri::HTML(@slider_html)
      html.css('.slider-container').children.css('label').should_not be_blank
      html.css('.slider-container').children.css('input#tickets').should_not be_blank
    end

    it "creates a label" do
      @slider_html.should match('<label>Tickets <span class=\"val\"></span>')
    end

    it "generates a text input with the given value and name" do
      @slider_html.should match('<input id="tickets" name="tickets" type="text" value="4" />')
    end

    it "generates a slider div with the appropriate data attributes" do
      html = Nokogiri::HTML(@slider_html)
      html.at_css('.slider')["data-min"].should == "1"
      html.at_css('.slider')["data-max"].should == "10"
      html.at_css('.slider')["data-step"].should == "1"
      html.at_css('.slider')["data-color"].should == "red"
      html.at_css('.slider')["data-value-display"].should == "#value_display"
    end

    context "customizing the label" do
      it "allows customization of the label's name" do
        label_name = 'Film Score'
        @slider_html = @template.slider_field_tag(:rating, 5, label: { name: label_name }, min: 1, max: 10, color: 'red')
        @slider_html.should match("<label>#{label_name} <span class=\"val\"></span></label>")
      end

      it "creates a data attribute containing the additional text that will be appended to the label" do
        @slider_html = @template.slider_field_tag(:rating, 5, label: { append: "additional text" }, min: 1, max: 10, color: 'red')
        html = Nokogiri::HTML(@slider_html)
        html.at_css('.slider')["data-append"].should == "additional text"
      end

      it "doesn't create a label if the label option was set to false" do
        @slider_html = @template.slider_field_tag(:rating, 5, label: false, min: 1, max: 10, color: 'red')
        html = Nokogiri::HTML(@slider_html)
        html.at_css('label').should be_blank
      end
    end
  end

  context "slider_form_builder" do
    before(:each) do
      @template = ActionView::Base.new
      @template.output_buffer = ''
      @film = Film.new(director: 'Francis Ford Coppola', title: 'The Conversation', rating: 10)
      @builder = FormSlider::SliderFormBuilder::SliderFormForBuilder.new(:film,  @film, @template, {})
      @slider_html = @builder.slider_field(:rating, min: 1, max: 10, color: 'red', value_display:'#value_display')
    end

    it "generates a container div for the slider field" do
      html = Nokogiri::HTML(@slider_html)
      html.css('.slider-container').children.css('label').should_not be_blank
      html.css('.slider-container').children.css('input#film_rating').should_not be_blank
    end

    it "creates a label" do
      @slider_html.should match('<label>Rating <span class=\"val\"></span></label>')
    end

    it "generates a text input with the given value and name" do
      @slider_html.should match('<input id="film_rating" name="film\[rating\]" type="text" value="10" />')
    end

    it "generates a slider div with the appropriate data attributes" do
      html = Nokogiri::HTML(@slider_html)
      html.at_css('.slider')["data-min"].should == "1"
      html.at_css('.slider')["data-max"].should == "10"
      html.at_css('.slider')["data-step"].should == "1"
      html.at_css('.slider')["data-color"].should == "red"
      html.at_css('.slider')["data-value-display"].should == "#value_display"
    end

    context "customizing the label" do
      it "allows customization of the label's name" do
        label_name = 'Film Score'
        @slider_html = @builder.slider_field(:rating, label: { name: label_name }, min: 1, max: 10, color: 'red')
        @slider_html.should match("<label>#{label_name} <span class=\"val\"></span></label>")
      end

      it "creates a data attribute containing the additional text that will be appended to the label" do
        @slider_html = @builder.slider_field(:rating, label: { append: "additional text" }, min: 1, max: 10, color: 'red')
        html = Nokogiri::HTML(@slider_html)
        html.at_css('.slider')["data-append"].should == "additional text"
      end

      it "doesn't create a label if the label option was set to false" do
        @slider_html = @builder.slider_field(:rating, label: false, min: 1, max: 10, color: 'red')
        html = Nokogiri::HTML(@slider_html)
        html.at_css('label').should be_blank
      end
    end
  end
end
