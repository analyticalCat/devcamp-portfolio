ready = undefined

ready = ->
  $('.sortable').sortable()
  alert('I am in coffee')
  return

$(document).ready ready