Class {
	#name : #NavigationButtonsView,
	#superclass : #WAPainter,
	#instVars : [
		'addToDoButton',
		'modifyAnExistentToDoButton',
		'viewToDosButton'
	],
	#category : #'Exercise2-To-Do-Web-Web Views'
}

{ #category : #initialization }
NavigationButtonsView >> initialize [

	self
		initializeAddToDoButton;
		initializeViewToDosButton;
		initializeModifyAnExistentToDoButton.
]

{ #category : #initialization }
NavigationButtonsView >> initializeAddToDoButton [

	addToDoButton := self componentSupplier
		asynchronicButtonLabeled: 'Add ToDo'
		applying: [ :theButton | theButton addClass bootstrap3 buttonDefault ].

	addToDoButton beIdentifiable
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
		applying: [ :theButton | theButton addClass bootstrap3 buttonDefault ]
]

{ #category : #rendering }
NavigationButtonsView >> renderContentOn: aCanvas [

	addToDoButton on trigger
		"enable: modifyAnExistentToDoButton;"
		"enable: viewToDosButton;"
		serverDo: [ self session applicationContext changeCurrentSubViewTo: AddToDoView new ];
		render: self session applicationContext identifiedMainView.

	viewToDosButton on trigger
		serverDo: [ self session applicationContext changeCurrentSubViewTo: ToDoTableView new ].
		"render: self session applicationContext identifiedMainView."

	aCanvas
		render: viewToDosButton;
		render: addToDoButton;
		render: modifyAnExistentToDoButton
]
