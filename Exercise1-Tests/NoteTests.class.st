Class {
	#name : #NoteTests,
	#superclass : #ListTests,
	#category : #'Exercise1-Tests'
}

{ #category : #tests }
NoteTests >> testModifyAssignee [
	
	| aNote |
	aNote := Note withDescription: 'Volver loco a Q' assignedTo: 'Fede'.
	self assert: aNote assignee equals: 'Fede'.
	
	aNote assignee: 'Agus'.
	self assert: aNote assignee equals: 'Agus'.
]

{ #category : #tests }
NoteTests >> testModifyCategory [
	
	| aNote |
	aNote := Note withDescription: 'Volver loco a Q' assignedTo: 'Fede'.
	
	aNote category withContentDo: [ self fail ] ifUnused: [ ]. 
	aNote changeCategory: 'Urgente'.
	self assert: aNote category equals: 'Urgente'.
]

{ #category : #tests }
NoteTests >> testModifyEndDate [
	
	| aNote aDate |
	aDate := August twentysixth, 2022. 
	aNote := Note withDescription: 'Volver loco a Q' assignedTo: 'Fede'.
	aNote closesOn withContentDo: [ self fail ] ifUnused: [ ]. 
	
	aNote changeEndDate: aDate.
	self assert: aNote closesOn equals: aDate.
]

{ #category : #tests }
NoteTests >> testModifyStatus [
	
	| aNote |
	aNote := Note withDescription: 'Volver loco a Q' assignedTo: 'Fede'.
	self assert: aNote status equals: 'Open'.
	
	aNote changeStatus: 'In Progress'.
	self assert: aNote status equals: 'In Progress'.
]

{ #category : #tests }
NoteTests >> testNoteCreation [

| aNote |

aNote := Note withDescription: 'Hola' assignedTo: 'Robert'.

self
	assert: aNote description equals: 'Hola';
	assert: aNote assignee equals: 'Robert';
	assert: aNote status equals: 'Open'.
	
	aNote category withContentDo: [ self fail ] ifUnused: [ ].
	aNote closesOn withContentDo: [ self fail ] ifUnused: [ ]. 
]
