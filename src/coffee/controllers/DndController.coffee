class DndController

  constructor: (@$scope, CharacterService) ->
    CharacterService.get().then (character) =>
      @$scope.character = character
