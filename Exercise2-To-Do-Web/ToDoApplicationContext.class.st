Class {
	#name : #ToDoApplicationContext,
	#superclass : #GRObject,
	#instVars : [
		'toDoSystem',
		'employeeSystem',
		'currentContextSubView',
		'mainView'
	],
	#category : #'Exercise2-To-Do-Web-Application'
}

{ #category : #'instance creation' }
ToDoApplicationContext class >> workingWith: theMainView [

	^ self new initializeWorkingWith: theMainView
]

{ #category : #'as yet unclassified' }
ToDoApplicationContext >> changeCurrentSubViewTo: anotherView [

	currentContextSubView := anotherView.
]

{ #category : #accessing }
ToDoApplicationContext >> currentContextSubView [

	^ currentContextSubView 
]

{ #category : #accessing }
ToDoApplicationContext >> employeeSystem [

	^ employeeSystem 
]

{ #category : #initialization }
ToDoApplicationContext >> initializeEmployeeSystem [

	employeeSystem := Employees
		with:
			( Set
				with: 'Fede'
				with: 'Edu'
				with: 'Flor'
				with: 'Unassigned' )
]

{ #category : #initialization }
ToDoApplicationContext >> initializeToDoSystem [

	| anotherToDo aToDo |

	toDoSystem := ToDoManagementSystem belongingTo: 'Mercap'.
	aToDo := ToDo withDescription: 'Work hard'.
	anotherToDo := ToDo withDescription: 'Play hard'.
	toDoSystem
		addToDo: aToDo;
		addToDo: anotherToDo
]

{ #category : #initialization }
ToDoApplicationContext >> initializeWorkingWith: theMainView [

	mainView := theMainView.
	self
		initializeToDoSystem;
		initializeEmployeeSystem.
		
	
	self changeCurrentSubViewTo: mainView initialNavigationContent 
]

{ #category : #accessing }
ToDoApplicationContext >> mainView [
	^ mainView
]

{ #category : #accessing }
ToDoApplicationContext >> toDoSystem [

	^ toDoSystem 
]
