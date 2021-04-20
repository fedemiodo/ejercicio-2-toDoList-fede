Class {
	#name : #ToDoList,
	#superclass : #Object,
	#instVars : [
		'owner',
		'elements'
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

{ #category : #'as yet unclassified' }
ToDoList class >> ownedBy: anOwner
withelements: aCollection [

self assertIsValidOwner: anOwner.
self assertWithValidElements: aCollection. 

^ self new initializeBelongingTo: anOwner withElements: aCollection.

]

{ #category : #accessing }
ToDoList >> elements [
	^ elements
]

{ #category : #initialization }
ToDoList >> initializeBelongingTo: anOwner withElements: aCollection [ 
	
	owner:= anOwner.
	elements:= aCollection.
]

{ #category : #'instance creation' }
ToDoList >> newElement: anElement [ 
	self elements with: anElement .
]

{ #category : #accessing }
ToDoList >> owner [
	^ owner
]
