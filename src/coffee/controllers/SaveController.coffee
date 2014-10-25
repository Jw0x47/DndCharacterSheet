class SaveController

  constructor: (@$scope) ->

  totalSave: (save) =>
    base = save.base + @abilityModifier(@getAbility(save))
    save.modifiers.map((mod) -> mod.modifier).reduce ((x, y) -> x + y), base

  getAbility: (save) =>
    @$scope.character.abilities.filter((a) -> a.name == save.ability)[0].score

  abilityModifier: (abilityScore) -> Math.floor((abilityScore - 10) / 2)
