Class {
	#name : #Employees,
	#superclass : #Object,
	#instVars : [
		'companyName',
		'employees'
	],
	#category : #'Exercise1-Model'
}

{ #category : #'as yet unclassified' }
Employees class >> initializeWith: aCollectionOfPeople [
	
	^ self new initializeEmployeesWith: aCollectionOfPeople .
]

{ #category : #'as yet unclassified' }
Employees >> allEmployees [
	^ employees
]

{ #category : #'as yet unclassified' }
Employees >> initializeEmployeesWith: aCollectionOfPeople [ 
	
	employees := Set new.
	employees addAll: aCollectionOfPeople .
]
