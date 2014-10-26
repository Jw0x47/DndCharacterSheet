class CharacterService

  constructor: (@$http) ->

  get: -> @$http.get('/static/data.json').then (response) -> response.data
