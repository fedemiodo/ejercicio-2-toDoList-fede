Class {
	#name : #ToDoManagementSystem,
	#superclass : #Object,
	#instVars : [
		'owner',
		'allNotes'
	],
	#classInstVars : [
		'owner',
		'elements'
	],
	#category : #'Exercise2-Model'
}

{ #category : #testing }
ToDoManagementSystem class >> assertIsValidOwner: anOwner [

AssertionChecker
	enforce: [ anOwner isNotEmpty  ]
	because: 'The owner field cannot be empty.'
	raising: InstanceCreationFailed 
]

{ #category : #initialization }
ToDoManagementSystem class >> belongingTo: anOwner [

	self assertIsValidOwner: anOwner .
	
	^ self new initializeBelongingTo: anOwner .
]

{ #category : #'instance creation' }
ToDoManagementSystem >> addToDo: aToDo [

	self assertToDoIsUnique: aToDo.

	^ self listAllNotes
		add: aToDo;
		yourself
]

{ #category : #'instance creation' }
ToDoManagementSystem >> assertToDoIsUnique: aToDo [

	AssertionChecker enforce: [ (self listAllNotes includes: aToDo) not ] because: [ 'A ToDo cannot be a duplicate of another.' ] raising: InstanceCreationFailed
]

{ #category : #'as yet unclassified' }
ToDoManagementSystem >> deleteToDo: aToDo [

	self listAllNotes remove: aToDo ifAbsent: 'ToDo was not found'.
]

{ #category : #initialization }
ToDoManagementSystem >> initializeBelongingTo: anOwnerName [
	
	owner:= anOwnerName.
	allNotes := Set new.
]

{ #category : #'as yet unclassified' }
ToDoManagementSystem >> listAllNotes [
	^ allNotes
]

{ #category : #'as yet unclassified' }
ToDoManagementSystem >> listClosedNotes [
	
	^ (allNotes select: [ :aToDo | aToDo status = 'Closed' ])
]

{ #category : #'as yet unclassified' }
ToDoManagementSystem >> listInProgressNotes [
	
	^ (allNotes select: [ :aNote | aNote status = 'In Progress' ])
]

{ #category : #'as yet unclassified' }
ToDoManagementSystem >> listOpenNotes [
	
	^ (allNotes select: [ :aNote | aNote status = 'Open' ])
]

{ #category : #'as yet unclassified' }
ToDoManagementSystem >> noteWithDescription: aDescription reassign: aName [ 

	self listAllNotes
		detect: [ :aNote | aNote description = aDescription ]
		ifFound: [ :aNote | aNote changeAssignee: aName ]		
		ifNone: [ 'Note not found' ]		
	
]

{ #category : #accessing }
ToDoManagementSystem >> owner [
	^ owner
]

{ #category : #'as yet unclassified' }
ToDoManagementSystem >> reassign: aDescription to: aName [ 
	
	self noteWithDescription: aDescription reassign: aName.
]

{ #category : #rendering }
ToDoManagementSystem >> renderContentOn: aCanvas [

	aCanvas listItem: allNotes 
]
