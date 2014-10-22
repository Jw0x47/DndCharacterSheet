class SaveController

  constructor: (@$scope) ->
    @$scope.totalSave = @totalSave
    @$scope.getAbility = @getAbility
    @$scope.modifier = @modifier

  totalSave: (save) ->
    base = save.base + @modifier(@getAbility(save))
    save.modifiers.map((mod) -> mod.modifier).reduce ((x, y) -> x + y), base

  getAbility: (save) => @$scope.character.abilities.filter((a) -> a.name == save.ability)[0].score

  modifier: (abilityScore) -> Math.floor((abilityScore - 10) / 2)
