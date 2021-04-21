Class {
	#name : #ListTests,
	#superclass : #TestCase,
	#instVars : [
		'fechaTest',
		'closesOn'
	],
	#classInstVars : [
		'owner'
	],
	#category : #'Exercise1-Tests'
}

{ #category : #tests }
ListTests >> testListCreation [
	
	| aList |
	aList := ToDoList initializeBelongingTo: 'Mercap'.
	
	self assertCollection: aList listAllNotes hasSameElements: #().
]
