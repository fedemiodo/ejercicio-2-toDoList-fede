Class {
	#name : #ToDoTests,
	#superclass : #TestCase,
	#category : #'Exercise2-Tests'
}

{ #category : #tests }
ToDoTests >> testCreateAssignedToDo [

| aNote |

aNote := ToDo withDescription: 'Hola' assignedTo: 'Robert'.

self
	assert: aNote description equals: 'Hola';
	assert: aNote status equals: 'Open'.
	self assert: aNote assignee equals: (Optional containing: 'Robert').
	aNote category withContentDo: [ self fail ] ifUnused: [ ].
	aNote closingDate withContentDo: [ self fail ] ifUnused: [ ]. 
]

{ #category : #tests }
ToDoTests >> testCreateNotAssignedToDo [

| aNote |

aNote := ToDo withDescription: 'Hola'.

self
	assert: aNote description equals: 'Hola';
	assert: aNote status equals: 'Open'.
	aNote assignee withContentDo: [ self fail ] ifUnused: [ ].
	aNote category withContentDo: [ self fail ] ifUnused: [ ].
	aNote closingDate withContentDo: [ self fail ] ifUnused: [ ]. 
]

{ #category : #tests }
ToDoTests >> testModifyAssignee [
	
	| aNote |
	aNote := ToDo withDescription: 'Volver loco a Q' assignedTo: 'Fede'.
	self assert: aNote assignee equals: (Optional containing: 'Fede').
	
	aNote changeAssignee: 'Agus'.
	self assert: aNote assignee equals: (Optional containing: 'Agus')
]

{ #category : #tests }
ToDoTests >> testModifyCategory [
	
	| aNote |
	aNote := ToDo withDescription: 'Volver loco a Q' assignedTo: 'Fede'.
	
	aNote category withContentDo: [ self fail ] ifUnused: [ ]. 
	aNote changeCategory: 'Urgente'.
	aNote category withContentDo: [ self assert: aNote category equals: (Optional containing: 'Urgente') ] ifUnused: [ self fail ].
]

{ #category : #tests }
ToDoTests >> testModifyEndDate [
	
	| aNote aDate |
	aDate := August twentysixth, 2022. 
	aNote := ToDo withDescription: 'Volver loco a Q' assignedTo: 'Fede'.
	aNote closingDate withContentDo: [ self fail ] ifUnused: [ ]. 
	
	aNote changeEndDate: aDate.
	aNote closingDate withContentDo: [ :theContent | self assert: theContent equals: aDate ] ifUnused: [ self fail ].
]

{ #category : #tests }
ToDoTests >> testModifyStatus [
	
	| aNote |
	aNote := ToDo withDescription: 'Volver loco a Q' assignedTo: 'Fede'.
	self assert: aNote status equals: 'Open'.
	
	aNote changeStatus: 'In Progress'.
	self assert: aNote status equals: 'In Progress'.
]
