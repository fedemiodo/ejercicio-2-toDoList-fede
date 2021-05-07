Class {
	#name : #Employee,
	#superclass : #Object,
	#instVars : [
		'employeeName'
	],
	#category : #'Exercise2-Model'
}

{ #category : #'instance creation' }
Employee class >> named: aName [

	^ self new initializeWithName: aName
]

{ #category : #initialization }
Employee >> initializeWithName: aName [

	employeeName := aName.
]

{ #category : #accessing }
Employee >> name [ 

	^ employeeName
]
