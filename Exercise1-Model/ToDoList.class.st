Class {
	#name : #ToDoList,
	#superclass : #Object,
	#instVars : [
		'owner',
		'allNotes'
	],
	#classInstVars : [
		'owner',
		'elements'
	],
	#category : #'Exercise1-Model'
}

{ #category : #testing }
ToDoList class >> assertIsValidOwner: anOwner [

AssertionChecker
	enforce: [ anOwner isNotEmpty  ]
	because: 'The owner field cannot be empty.'
	raising: InstanceCreationFailed 
]

{ #category : #initialization }
ToDoList class >> initializeBelongingTo: anOwner [

	self assertIsValidOwner: anOwner .
	
	^ self new initializeBelongingTo: anOwner .
]

{ #category : #'instance creation' }
ToDoList >> addNote: aTask [ 
	self listAllNotes add: aTask.
	self listOpenNotes add: aTask.
]

{ #category : #'as yet unclassified' }
ToDoList >> createNote: aDescription assignedTo: anEmployee [
	| aNote |
	aNote := Note withDescription: aDescription assignedTo: anEmployee .
	self listAllNotes add: aNote.
	
]

{ #category : #'as yet unclassified' }
ToDoList >> deleteNote: aDescription [ 
	
	self listAllNotes
		detect: [ :aNote | aNote description = aDescription ]
		ifFound: [ :aNote | self listAllNotes remove: aNote ]		
		ifNone: 'Note not found.'
]

{ #category : #initialization }
ToDoList >> initializeBelongingTo: anOwner [
	
	owner:= anOwner.
	allNotes := OrderedCollection new.
]

{ #category : #accessing }
ToDoList >> last [

	^ allNotes last
]

{ #category : #'as yet unclassified' }
ToDoList >> listAllNotes [
	^ allNotes
]

{ #category : #'as yet unclassified' }
ToDoList >> listClosedNotes [
	
	^ (allNotes select: [ :aNote | aNote status = 'Closed' ])
]

{ #category : #'as yet unclassified' }
ToDoList >> listInProgressNotes [
	
	^ (allNotes select: [ :aNote | aNote status = 'In Progress' ])
]

{ #category : #'as yet unclassified' }
ToDoList >> listOpenNotes [
	
	^ (allNotes select: [ :aNote | aNote status = 'Open' ])
]

{ #category : #'as yet unclassified' }
ToDoList >> noteWithDescription: aDescription reassign: aName [ 

	self listAllNotes
		detect: [ :aNote | aNote description = aDescription ]
		ifFound: [ :aNote | aNote assignee: aName ]		
		ifNone: 'Note not found.'
		
	
]

{ #category : #accessing }
ToDoList >> owner [
	^ owner
]

{ #category : #'as yet unclassified' }
ToDoList >> reassign: aDescription to: aName [ 
	
	self noteWithDescription: aDescription reassign: aName.
]

{ #category : #rendering }
ToDoList >> renderContentOn: aCanvas [

	aCanvas listItem: allNotes 
]
