dndSheetsApp = angular.module 'dndCharacterSheets', ["xeditable"]

dndSheetsApp.run (editableOptions) ->
  editableOptions.theme = "bs3"

dndSheetsApp.controller 'CharSheet', ($scope, $http) ->
  $http.get("/static/data.json").success (data) ->
    $scope.char = data

  $scope.abilityScoreUpdate = () ->
    $scope.char.abilities = $scope.char.abilities.map (ability) ->
      name: ability.name
      score: ability.score
      modifier: Math.floor((ability.score - 10) / 2)

  $scope.getAbilityModifier = (abilityName) ->

    arr = for ability in $scope.char.abilities
            if ability.name == abilityName
              ability.modifier
            else null
    arr.reduce (x, y) -> x + y

  $scope.getSaveCompositeModifier = (modifiers) ->
    ## hax
    total = modifiers.reduce (x, y) ->
              x + y.modifier
            , 0  ## coffee WHY

  $scope.savesTotalUpdate = () ->
    $scope?.char?.saves = $scope?.char?.saves.map (save) ->
      name: save.name
      ability: save.ability
      base: save.base
      modifiers: save.modifiers
      total: save.base +
             $scope.getAbilityModifier(save.ability) +
             $scope.getSaveCompositeModifier(save.modifiers)

  # this causes an error where it errors on load but then works
  # " TypeError: Cannot read property 'saves' of undefined "
  $scope.$watch "char.abilities", (newVal, oldVal) ->
    $scope.savesTotalUpdate()

  $scope.cancel = () -> # ... nothing special yet

  $scope.updateCharacterFacts = () ->
    # ... TODO ... anything?
  $scope.updateCharacterNames = () ->
    # ... TODO ... anything?
  $scope.updateSaves = () ->
    # ... TODO
  $scope.updateStats = () ->
    $scope.abilityScoreUpdate()
    $scope.savesTotalUpdate()
