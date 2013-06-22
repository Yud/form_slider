$.fn.applyGradient = (position) -> 
  position = parseInt(position) - 1
  gradientStyle = ""
  browserVariations = ["-moz-linear-gradient", "linear-gradient", "-o-linear-gradient", "-webkit-linear-gradient", "-ms-linear-gradient"]
  for browser in browserVariations 
    gradientStyle += 'background-image: '+browser+'(left, '+@.data('color')+' '+position+'px, white 0%);'
  @.attr('style', gradientStyle)

window.sliderInput =
  load: -> 
    sliders = $('form .slider')
    sliders.each ->
      currentSlider = $(@)
      currentSliderContainer = currentSlider.parents('.slider-container')
      inputField = currentSliderContainer.find('input[type="text"]')
      currentSlider.slider
        min: currentSlider.data('min'),
        max: currentSlider.data('max'),
        value: inputField.attr('value'),
        create: ->
          currentSliderContainer.find('label').append(' <span class="val">'+inputField.attr('value')+'</span>')
          currentSlider.applyGradient(currentSlider.find('.ui-slider-handle').css('left'))
          inputField.hide()
        change: ( event, ui ) ->
          inputField.val(ui.value).parents('.slider-container').find('.val').text(ui.value)
          currentSlider.applyGradient(currentSlider.find('.ui-slider-handle').css('left'))
        slide: ( event, ui ) ->
          inputField.val(ui.value).parents('.slider-container').find('.val').text(ui.value)

$(document).ready ->
  $(document).on "page:load", ->
    sliderInput.load()
  $(document).on "page:festch", ->
    sliderInput.load()
  sliderInput.load()
