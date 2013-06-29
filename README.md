# FormSlider

Easy integration of the jQuery UI slider within rails forms.

## Installation

Add this line to your application's Gemfile:

    gem 'form_slider'

And then execute:

    $ bundle

Add the jQuery ui slider library to application.js:

    //= require jquery
    //= require jquery.ui.slider

And Add the jquery ui css file to application.css:

   *= require jquery.ui.slider

## Usage

### Form For

### Form Tag


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

## Todo List

1. value_display
1. SimpleForm and Formtastic Support
