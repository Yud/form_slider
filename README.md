# FormSlider

jQuery UI Slider + Ruby on Rails Forms

###[Demo](http://form-slider-example-app.herokuapp.com/)

## Installation

### Rails 4.0

Add this line to your application's Gemfile:

    gem 'form_slider'

And then execute:

    $ bundle

Add the jQuery ui slider library and form_slider.js to application.js:

    //= require jquery
    //= require jquery.ui.slider
    //= require form_slider

Add the jquery ui css file to application.css:

    *= require jquery.ui.slider

### Rails 3.2

Add this line to your application's Gemfile:

    gem 'form_slider', :git => 'git://github.com/Yud/form_slider.git', :branch => 'rails-3.2'

And then execute:

    $ bundle

Add the jQuery ui slider library and form_slider.js to application.js:

    //= require jquery
    //= require jquery.ui.slider
    //= require form_slider

Add the jquery ui css file to application.css:

    *= require jquery.ui.slider

## Usage

### Form For
Use the **slider_form_for** builder instead of form_for, then use the **slider_field** helper to generate a slider with a label:

    = slider_form_for @film do |f|
      .field
        = f.slider_field :rating, min: 0, max: 10, step: 1
      .field
        = f.submit "Send"
    

### Form Tag
Use the **slider_field_tag** helper if you need to use a slider with form_tag:

    = slider_form_tag "/buy_tickets" do
      .field
        = slider_form_tag :number_of_tickets, 1, min: 1, max: 6, step: 1
      .field
        = submit_tag "Send"

### Formtastic Support
You can use form_slider with Formtastic's semantic_form_for:

    = semantic_form_for @film do |f|
      = f.inputs do
        = f.input :rating, as: :slider, min: 0, max: 10, step: 1, color: 'red'

### Field Options

<table>
  <tr>
    <th>Name</th>
    <th>Description</th>
    <th>Usage</th>
    <th>Default Value</th>
  </tr>
  <tr>
    <th>min</th>
    <td>The minimum value of the slider</td>
    <td><tt>= f.slider_field :name, min: 1</tt></td></td>
    <td>1</td>
  </tr>
  <tr>
    <th>max</th>
    <td>The maximum value of the slider</td>
    <td><tt>= f.slider_field :name, max: 10</tt></td></td>
    <td>10</td>
  </tr>
  <tr>
    <th>step</th>
    <td>Determines the size or amount of each interval or step the slider takes between the min and max</td>
    <td><tt>= f.slider_field :name, max: 10, step: 1</tt></td></td>
    <td>1</td>
  </tr>
  <tr>
    <th>color</th>
    <td>Background color of the slider</td>
    <td><tt>= f.slider_field :name, color: 'blue'</tt></td></td>
    <td>'white'</td>
  </tr>
  <tr>
    <th>label</th>
    <td>
      Customize the slider's label. Pass false to have no label.
      :name is the labels name
      :append is the text that will be appended to the label, right after the value of the slider
    </td>
    <td><tt>= f.slider_field :rate, label: { name: 'Rating:', append: 'out of 10' }, min: 1, max: 10, step: 1</tt></td></td>
    <td></td>
  </tr>
  <tr>
    <th>value_display</th>
    <td>
      CSS selector of the html element that displays the slider's
      value. By default the slider's value will be displayed in the
      slider's label, so use this option only if you need to override this
      behavior. 
    </td>
    <td><tt>= f.slider_field :name, color: 'blue', value_display: '#slider-val'</tt></td></td>
    <td></td>
  </tr>
</table>


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
