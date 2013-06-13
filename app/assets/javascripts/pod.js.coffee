# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

  $('.remove-button, .js-consume-feed-button').on 'click', (e) ->
    $el = $(e.currentTarget).next 'input'
    if $el.val() is 'false'
      $(e.currentTarget).tooltip('show')
      setTimeout -> 
        $(e.currentTarget).tooltip('hide')
      , 2000
    $el.val($el.val() == 'false') # toggle

  $('.js-consume-feed-button').on 'click', (e) ->
    $el = $('#pod_instagram_account_attributes_consume_from_feed')
    if $el.val() is 'true'
      $(e.currentTarget).find('i').addClass('icon-check').removeClass('icon-check-empty')
    else
      $(e.currentTarget).find('i').removeClass('icon-check').addClass('icon-check-empty')

  $('.twitter input').tooltip 
    title: 'Enter a Twitter username here, then select a List from the adjacent dropdown after updating the pod'
    placement: 'left'
    trigger: 'focus'

  $('.remove-button').tooltip
    title: 'This item will be deleted when the pod is updated'
    trigger: 'manual'
    placement: 'right'
  @

