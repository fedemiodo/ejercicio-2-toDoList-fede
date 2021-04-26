Class {
	#name : #ListTests,
	#superclass : #TestCase,
	#classInstVars : [
		'owner'
	],
	#category : #'Exercise1-Tests'
}

{ #category : #tests }
ListTests >> testCategorizeNote [

	| aList |
	
	aList := ToDoList initializeBelongingTo: 'Mercap'.
	aList createNote: 'La primer tarea' assignedTo: 'Fede'.

	aList last category withContentDo: [ self fail ] ifUnused: [ ]. 
	aList last category: 'Urgent'.	
	aList last category withContentDo: [ ] ifUnused: [ self fail ].
	self assert: aList last category asString equals: 'Urgent'.
	
	aList last category: 'Entertainment'.
	aList last category withContentDo: [ ] ifUnused: [ self fail ].
	self assert: aList last category asString equals: 'Entertainment'.
]

{ #category : #tests }
ListTests >> testCreatingANote [

	| aList |
	
	aList := ToDoList initializeBelongingTo: 'Mercap'.
	aList createNote: 'La primer tarea' assignedTo: 'Fede'.
	

	self assert: aList last assignee equals: 'Fede'.
	self assert: aList last description equals: 'La primer tarea'.
]

{ #category : #tests }
ListTests >> testDeletingANote [

	| aList |
	aList := ToDoList initializeBelongingTo: 'Mercap'.
	aList createNote: 'Create a note' assignedTo: 'Fede'.
	
	self assert: aList listAllNotes size equals: 1.
	
	aList deleteNote: 'Create a note'.
	self assert: aList listAllNotes size equals: 0.
]

{ #category : #tests }
ListTests >> testListCreation [
	
	| aList |
	aList := ToDoList initializeBelongingTo: 'Mercap'.
	
	self assert: aList owner equals: 'Mercap'.	
	self assertCollection: aList listAllNotes hasSameElements: #().
	
]

{ #category : #tests }
ListTests >> testReassignNote [

	| aList |
	
	aList := ToDoList initializeBelongingTo: 'Mercap'.
	aList createNote: 'La primer tarea' assignedTo: 'Fede'.
	self assert: aList last assignee equals: 'Fede'.

	aList reassign: 'La primer tarea' to: 'Agus'.
	self assert: aList last assignee equals: 'Agus'.
]
