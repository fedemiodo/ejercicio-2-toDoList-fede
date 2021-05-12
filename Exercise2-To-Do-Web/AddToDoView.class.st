Class {
	#name : #AddToDoView,
	#superclass : #WAPainter,
	#instVars : [
		'addToDoAssigneeField',
		'addToDoDescriptionField',
		'addToDoCategoryField',
		'addToDoEndDateField',
		'addToDoFieldContainer',
		'addToDoConfirmButton'
	],
	#category : #'Exercise2-To-Do-Web-Web Views'
}

{ #category : #accessing }
AddToDoView >> addToDoConfirmButton [
	^ addToDoConfirmButton
]

{ #category : #accessing }
AddToDoView >> addToDoDescriptionField [
	^ addToDoDescriptionField
]

{ #category : #initialization }
AddToDoView >> initialize [

	self
		initializeAddToDoConfirmButton;
		initializeAddToDoDescriptionField;
		initializeAddToDoAssigneeField;
		initializeAddToDoCategoryField;
		initializeAddToDoEndDateField.
		

	addToDoFieldContainer := self componentSupplier
		inlineContainerWrapping: [ :canvas | 
			canvas
				render: addToDoAssigneeField;
				render: addToDoDescriptionField;
				render: addToDoCategoryField;
				render: addToDoEndDateField;
				render: addToDoConfirmButton
			]
		applying: [  ]
]

{ #category : #initialization }
AddToDoView >> initializeAddToDoAssigneeField [

	addToDoAssigneeField := self componentSupplier
		dropdownListApplying: [ :theField |  ]
		applyingToOptions: [  ].

	addToDoAssigneeField allowAnyOf: self session applicationContext employeeSystem allEmployees
]

{ #category : #initialization }
AddToDoView >> initializeAddToDoCategoryField [

		addToDoCategoryField := self componentSupplier
			singleLineTextFieldApplying: [ :theField | theField setPlaceholderTo: 'Write a category...' ]
]

{ #category : #initialization }
AddToDoView >> initializeAddToDoConfirmButton [

	addToDoConfirmButton := self componentSupplier
		asynchronicButtonLabeled: 'Confirm'
		applying: [ :theButton | theButton addClass bootstrap3 buttonPrimary + theButton beDisabled ]
]

{ #category : #initialization }
AddToDoView >> initializeAddToDoDescriptionField [

	addToDoDescriptionField := self componentSupplier
		singleLineTextFieldApplying: [ :theField | theField setPlaceholderTo: 'Write a description...' ].

	addToDoDescriptionField on trigger
		serializeIt;
		enable: addToDoConfirmButton
]

{ #category : #initialization }
AddToDoView >> initializeAddToDoEndDateField [

		addToDoEndDateField := self componentSupplier 
			dateFieldApplying: [ :theField | ]
]

{ #category : #rendering }
AddToDoView >> renderContentOn: aCanvas [

	aCanvas
		heading: 'Adding a ToDo';
		render: addToDoFieldContainer
]
