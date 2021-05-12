Class {
	#name : #NavigationButtonsView,
	#superclass : #WAPainter,
	#instVars : [
		'addToDoButton',
		'modifyAnExistentToDoButton',
		'viewToDosButton',
		'addToDoView'
	],
	#category : #'Exercise2-To-Do-Web-Web Views'
}

{ #category : #rendering }
NavigationButtonsView >> addToDoButtonBehavior [

	addToDoView ifNil: [ self initializeAddToDoView ].

	addToDoButton on trigger
		disable;
		serverDo: [ self session applicationContext changeCurrentSubViewTo: addToDoView ];
		render: self session applicationContext mainView navigationContentWrapper;
		enable: viewToDosButton
]

{ #category : #rendering }
NavigationButtonsView >> addToDoViewConfirmButtonBehavior [

	addToDoView addToDoConfirmButton on trigger
		serverDo: [ | aToDo |

			aToDo := ToDo withDescription: addToDoView addToDoDescriptionField model.
			( self session applicationContext toDoSystem assertToDoIsUnique: aToDo )
				ifTrue: [ self session applicationContext toDoSystem addToDo: aToDo ]
				ifFalse: [  ].
			self session applicationContext changeCurrentSubViewTo: ToDoTableView new
			];
		render: self session applicationContext mainView navigationContentWrapper;
		disable: viewToDosButton;
		enable: addToDoButton
]

{ #category : #initialization }
NavigationButtonsView >> initialize [

	self
		initializeAddToDoButton;
		initializeViewToDosButton;
		initializeModifyAnExistentToDoButton
]

{ #category : #initialization }
NavigationButtonsView >> initializeAddToDoButton [

	addToDoButton := self componentSupplier
		asynchronicButtonLabeled: 'Add ToDo'
		applying: [ :theButton | theButton addClass bootstrap3 buttonDefault ].

	addToDoButton beIdentifiable
]

{ #category : #initialization }
NavigationButtonsView >> initializeAddToDoView [

	addToDoView := AddToDoView new
]

{ #category : #initialization }
NavigationButtonsView >> initializeModifyAnExistentToDoButton [

	modifyAnExistentToDoButton := self componentSupplier
		asynchronicButtonLabeled: 'Edit a ToDo'
		applying: [ :theButton | theButton addClass bootstrap3 buttonDefault ].
		
	modifyAnExistentToDoButton beIdentifiable
]

{ #category : #initialization }
NavigationButtonsView >> initializeViewToDosButton [

	viewToDosButton := self componentSupplier
		asynchronicButtonLabeled: 'View ToDos'
		applying: [ :theButton | theButton addClass bootstrap3 buttonDefault + theButton beDisabled ].

	viewToDosButton beIdentifiable.
]

{ #category : #rendering }
NavigationButtonsView >> renderContentOn: aCanvas [

	self
		addToDoButtonBehavior;
		viewToDoButtonBehavior;
		addToDoViewConfirmButtonBehavior.

	aCanvas
		render: viewToDosButton;
		render: addToDoButton;
		render: modifyAnExistentToDoButton
]

{ #category : #rendering }
NavigationButtonsView >> viewToDoButtonBehavior [

	viewToDosButton on trigger
		disable;
		serverDo: [ self session applicationContext changeCurrentSubViewTo: ToDoTableView new ];
		render: self session applicationContext mainView navigationContentWrapper;
		enable: addToDoButton
]
