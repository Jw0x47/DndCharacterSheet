angular.module 'dndCharacterSheets', ["xeditable"]
       .run (editableOptions) -> editableOptions.theme = "bs3"
       .service 'CharacterService', ['$http', CharacterService]
       .controller 'DndController', ['$scope', 'CharacterService', DndController]
       .controller 'ModifierController', ['$scope', ModifierController]
       .controller 'SaveController', ['$scope', SaveController]
