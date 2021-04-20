Class {
	#name : #ListTests,
	#superclass : #TestCase,
	#instVars : [
		'owner',
		'startingElements'
	],
	#classInstVars : [
		'owner'
	],
	#category : #'Exercise1-Tests'
}

{ #category : #tests }
ListTests >> testCreation [

| aList |

aList := ToDoList ownedBy: 'Federico' withelements: (Array with: 'Crear una to do list').
		
self assert: aList owner equals: 'Federico'.
self assert: aList elements equals: (Array with: 'Crear una to do list').
]

{ #category : #tests }
ListTests >> testInsertingAnElement [

| aList |
aList := ToDoList ownedBy: 'Federico' withelements: #().

	self assert: aList elements isEmpty .

aList newElement: 'Regar las plantas'.

	self assert: aList elements equals: #('Regar las plantas').
]

{ #category : #tests }
ListTests >> testRemovingAnElement [ 

| aList |
aList := ToDoList ownedBy: 'Federico' withelements: #().

	self assert: aList elements isEmpty .
	
aList addElement: 'Regar las plantas'.
	
	self assert: aList elements equals: #('Regar las plantas').


aList removeElement: 'Regar las plantas'.
	
	self assert: aList elements equals: #().
	

]
