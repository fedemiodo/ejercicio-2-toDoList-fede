Class {
	#name : #EmployeeTests,
	#superclass : #TestCase,
	#category : #'Exercise2-Tests'
}

{ #category : #tests }
EmployeeTests >> testCreatingTheEmployees [

	| aGroupOfPeople employees |
	aGroupOfPeople := Set with: 'Fede' with: 'Edu' with: 'Flor'.
	
	employees := Employees initializeWith: aGroupOfPeople .
	self assertCollection: employees allEmployees hasSameElements: aGroupOfPeople .
]
