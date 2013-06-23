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
  </tr>
  <tr>
    <th>min</th>
    <td>The minimum value of the slider</td>
    <td><tt>= f.slider_field :name, min: 1</td></td>
  </tr>
  <tr>
    <th>max</th>
    <td>The maximum value of the slider</td>
    <td><tt>= f.slider_field :name, max: 10</td></td>
  </tr>
  <tr>
    <th>color</th>
    <td>Background color of the slider</td>
    <td><tt>= f.slider_field :name, color: 'blue'</td></td>
  </tr>
  <tr>
    <th>label</th>
    <td>Customize the slider's label</td>
    <td><tt>= f.slider_field :name,  label: 'Customized Field Name'</td></td>
  </tr>
</table>


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
