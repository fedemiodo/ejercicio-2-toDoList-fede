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
	self assert: aList last category equals: 'Urgent'.
	
	"aList last category withContentDo: [  ] ifUnused: [ self fail ]."
	aList last category: 'Entertainment'.
	self assert: aList last category equals: 'Entertainment'.


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
