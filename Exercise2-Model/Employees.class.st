Class {
	#name : #Employees,
	#superclass : #Object,
	#instVars : [
		'companyName',
		'employees'
	],
	#category : #'Exercise2-Model'
}

{ #category : #'instance creation' }
Employees class >> createEmpty [
	
	^ self new initializeEmployees
]

{ #category : #'instance creation' }
Employees class >> with: aCollectionOfEmployees [
	
	^ self new initializeEmployeesWith: aCollectionOfEmployees .
]

{ #category : #adding }
Employees >> addEmployee: anEmployee [

	employees add: anEmployee
]

{ #category : #accesing }
Employees >> allEmployees [
	^ employees
]

{ #category : #initialization }
Employees >> initializeEmployees [
	
	employees := Set new.
]

{ #category : #initialization }
Employees >> initializeEmployeesWith: aCollectionOfEmployees [
	
	employees := Set withAll: aCollectionOfEmployees.
]
