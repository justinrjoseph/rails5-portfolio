$(document).on 'turbolinks:load', ->
  comments = $('#comments')
  
  if comments
    App.global_chat = App.cable.subscriptions.create {
      channel: 'BlogsChannel'
      blog_id: comments.data('blog-id')
    },
    connected: ->
    disconnected: ->
    received: (data) ->
      comments.append data.comment
    send_comment: (comment, blog_id) ->
      @perform 'send_comment', comment: comment, blog_id: blog_id

  $('#new_comment').submit (e) ->
    e.preventDefault()
    
    textarea = $(this).find('#comment_content')
    
    if $.trim(textarea.val())
      App.global_chat.send_comment textarea.val(), comments.data('blog-id')
      textarea.val('')
    
    return false