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

{ #category : #'as yet unclassified' }
ToDoList class >> assertWithValidElements: aCollection [

AssertionChecker
	enforce: [ aCollection allSatisfy: #isNotEmpty ]
	because: 'No element can be empty.'
	raising: InstanceCreationFailed 
]

{ #category : #initialization }
ToDoList class >> initializeBelongingTo: anOwner [

	self assertIsValidOwner: anOwner .
	
	^ self new initializeBelongingTo: anOwner .
]

{ #category : #'instance creation' }
ToDoList >> addElement: aTask [ 
	self listAllNotes add: aTask.
]

{ #category : #initialization }
ToDoList >> initializeBelongingTo: anOwner [
	
	owner:= anOwner.
	allNotes := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
ToDoList >> listAllNotes [
	^ allNotes
]

{ #category : #accessing }
ToDoList >> owner [
	^ owner
]
