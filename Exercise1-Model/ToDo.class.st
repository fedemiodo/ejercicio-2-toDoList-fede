Class {
	#name : #ToDo,
	#superclass : #Object,
	#instVars : [
		'description',
		'assignee',
		'openedSince',
		'category',
		'endDate',
		'closesOn',
		'status',
		'startDate'
	],
	#category : #'Exercise1-Model'
}

{ #category : #'as yet unclassified' }
ToDo class >> withDescription: aDescription assignedTo: aPerson [

	^ self new 
	initializeWithDescription: aDescription
	assignedTo: aPerson
	openedSince: GregorianCalendar currentDateTime
	closesOn: ''
	category: ''
	status: 'Open'.
]

{ #category : #accessing }
ToDo >> assignee [
	^ assignee
]

{ #category : #accessing }
ToDo >> assignee: aPerson [
	^ assignee:= aPerson
]

{ #category : #accessing }
ToDo >> category [
	^ category
]

{ #category : #accessing }
ToDo >> category: aCategory [
	category := aCategory
]

{ #category : #'as yet unclassified' }
ToDo >> changeCategory: aCategory [ 
	self category: aCategory.
]

{ #category : #'as yet unclassified' }
ToDo >> changeEndDate: aFixedDate [ 
	endDate:= aFixedDate.
]

{ #category : #'as yet unclassified' }
ToDo >> changeStatus: aStatus [
	self status: aStatus.
]

{ #category : #'as yet unclassified' }
ToDo >> closesOn [
	^ endDate
]

{ #category : #accessing }
ToDo >> description [
	^ description
]

{ #category : #'as yet unclassified' }
ToDo >> initializeWithDescription: aDescription
assignedTo: aPerson
openedSince: aDate
closesOn: aSecondDate
category: aCategory
status: aStatus [

description:= aDescription.
assignee:= aPerson.
startDate:= aDate.
endDate:= aSecondDate.
category:= aCategory.
status:= aStatus .

]

{ #category : #accessing }
ToDo >> openedSince [
	^ startDate 
]

{ #category : #'as yet unclassified' }
ToDo >> reassignTo: aPerson [
	self assignee: aPerson.
]

{ #category : #accessing }
ToDo >> status [
	^ status
]

{ #category : #accessing }
ToDo >> status: aStatus [
	status := aStatus
]
