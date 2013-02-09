class @ChirpWatcher
  boot: (url, hash) =>
    @url = url
    @hash = hash
    setTimeout(chirpWatcher.poll, 1000)
    $('#new-chirps-available a').click (e) ->
      e.preventDefault()
      window.location = window.location

  poll: =>
    $.ajax @url, dataType: "json",
    success: (res, status, xhr) ->
      chirpWatcher.handleResponse(res.hash)
    complete:
      setTimeout chirpWatcher.poll, 1000

  handleResponse: (hash) =>
    if @hash != hash
      $("#new-chirps-available").show()

window.chirpWatcher = new ChirpWatcher()