App.update_news = App.cable.subscriptions.create "UpdateNewsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log 
    $('#title').text(data.title)
    $('#description').text(data.description)
    $('#time').text(data.updated_at)
    $('#time').text(data.pubDate)

    # if data.updated_at == null
    #   $('#time').text(data.updated_at)
    # else
    #   updated_at = new Date(data.updated_at)
    #   $('#time').text(updated_at)
