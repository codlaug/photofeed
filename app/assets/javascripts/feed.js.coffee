# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $container = $('#container');
  $container.imagesLoaded ->
    $container.masonry({
      itemSelector : '.item',
      columnWidth: 100
    });

root = exports ? this
root._gaq = [['_setAccount', 'UA-36007606-2'], ['_trackPageview']]
 
insertGAScript = ->
  ga = document.createElement 'script'
  ga.type = 'text/javascript'
  ga.async = true
 
  proto = document.location.protocol
  proto = if (proto is 'https:') then 'https://ssl' else 'http://www'
  ga.src = "#{proto}.google-analytics.com/ga.js"
  
  s = document.getElementsByTagName 'script'
  s[0].parentNode.insertBefore ga, s

insertGAScript()

