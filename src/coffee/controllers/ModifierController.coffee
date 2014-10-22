class ModifierController

  constructor: (@$scope) ->
    @$scope.abilityModifier = @modifier

  modifier: (abilityScore) -> Math.floor((abilityScore - 10) / 2)
