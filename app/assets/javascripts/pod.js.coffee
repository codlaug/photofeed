# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('.remove-button').on 'click', (e) ->
    $el = $(e.currentTarget).next 'input'
    if $el.val() is 'false'
      $(e.currentTarget).tooltip('show')
      setTimeout -> 
        $(e.currentTarget).tooltip('hide')
      , 2000
    $el.val($el.val() == 'false') # toggle

  $('.twitter input').tooltip 
    title: 'Enter a Twitter username here, and then after updating the pod, select a List from the adjacent dropdown'
    placement: 'left'
    trigger: 'focus'

  $('.remove-button').tooltip
    title: 'This Twitter List will be deleted when the pod is updated'
    trigger: 'manual'
    placement: 'right'
  @

