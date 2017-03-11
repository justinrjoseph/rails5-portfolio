setPositions = ->
  $('.card').each (i) ->
    $(this).attr 'data-pos', i + 1
    return
  return

supportSorting = ->
  setPositions()
  
  $('.sortable').sortable()
  
  $('.sortable').sortable().bind 'sortupdate', (e, ui) ->
    updatedOrder = []
    
    setPositions()
    
    $('.card').each (i) ->
      updatedOrder.push
        id: $(this).data('id')
        position: i + 1
      return
      
    $.ajax
      url: '/portfolios/sort'
      type: 'PUT'
      data:
        order: updatedOrder
    return
  return

$(document).ready supportSorting