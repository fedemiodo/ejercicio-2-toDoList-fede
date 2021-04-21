Class {
	#name : #NoteTests,
	#superclass : #ListTests,
	#category : #'Exercise1-Tests'
}

{ #category : #tests }
NoteTests >> testModifyAssignee [
	
	| aToDo |
	aToDo := ToDo withDescription: 'Volver loco a Q' assignedTo: 'Fede'.
	self assert: aToDo assignee equals: 'Fede'.
	
	aToDo reassignTo: 'Agus'.
	self assert: aToDo assignee equals: 'Agus'.
]

{ #category : #tests }
NoteTests >> testModifyCategory [
	
	| aToDo |
	aToDo := ToDo withDescription: 'Volver loco a Q' assignedTo: 'Fede'.
	self assert: aToDo category equals: ''.
	aToDo changeCategory: 'Urgente'.
	self assert: aToDo category equals: 'Urgente'.
]

{ #category : #tests }
NoteTests >> testModifyEndDate [
	
	| aToDo aDate |
	aDate := August twentysixth, 2022. 
	aToDo := ToDo withDescription: 'Volver loco a Q' assignedTo: 'Fede'.
	self assert: aToDo closesOn equals: ''.
	
	aToDo changeEndDate: aDate.
	self assert: aToDo closesOn equals: aDate.
]

{ #category : #tests }
NoteTests >> testModifyStatus [
	
	| aToDo |
	aToDo := ToDo withDescription: 'Volver loco a Q' assignedTo: 'Fede'.
	self assert: aToDo status equals: 'Open'.
	
	aToDo changeStatus: 'In Progress'.
	self assert: aToDo status equals: 'In Progress'.
]

{ #category : #tests }
NoteTests >> testNoteCreation [

| aToDo |

aToDo := ToDo withDescription: 'Hola' assignedTo: 'Robert'.

self
	assert: aToDo description equals: 'Hola';
	assert: aToDo assignee equals: 'Robert';
	assert: aToDo category equals: '';
	assert: aToDo closesOn equals: '';
	assert: aToDo status equals: 'Open'.
]
