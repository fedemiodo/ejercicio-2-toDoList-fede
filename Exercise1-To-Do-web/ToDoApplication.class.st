Class {
	#name : #ToDoApplication,
	#superclass : #WillowApplication,
	#category : #'Exercise1-To-Do-web'
}

{ #category : #accessing }
ToDoApplication class >> applicationTitle [
	
	^ 'To Do List'
]

{ #category : #accessing }
ToDoApplication class >> handlerName [

	^ 'to-do'
]

{ #category : #'system startup' }
ToDoApplication class >> startUp [

	(ZnZincServerAdaptor port: 8080) start.
	self registerAsDevelopmentApplication.
]

{ #category : #accessing }
ToDoApplication >> componentSupplierForApplication [

	^ Html5ComponentSupplier new
]

{ #category : #accessing }
ToDoApplication >> contentView [

	| items aList |
	aList := ToDoList initializeBelongingTo: 'Fede'.
	aList createNote: 'Primer nota' assignedTo: 'Eze'.
	aList createNote: 'Tercera nota' assignedTo: 'Agus'.  
	items := aList listAllNotes.
	^ [ :canvas | self
		renderInputOn: canvas;
		renderButtonOn: canvas
		].

]

{ #category : #accessing }
ToDoApplication >> jQueryLibrary [

	^ JQuery3OnlineLibrary default  
]

{ #category : #rendering }
ToDoApplication >> renderButtonOn: aCanvas [
   | button |
     button := self componentSupplier
                       asynchronicButtonLabeled: 'Click me'
                       applying: [ :theButton | ].
     aCanvas render: button
]

{ #category : #rendering }
ToDoApplication >> renderInputOn: aCanvas [
   | field |
    field := self componentSupplier
                     singleLineTextFieldApplying: [ :theField | ].
    aCanvas render: field
]
