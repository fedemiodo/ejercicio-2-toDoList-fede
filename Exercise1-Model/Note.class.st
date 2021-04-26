Class {
	#name : #Note,
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
	#classInstVars : [
		'possibleStatuses'
	],
	#category : #'Exercise1-Model'
}

{ #category : #asserting }
Note class >> assertIsValidDescription: aDescription [
	
	AssertionChecker 
		enforce: [ aDescription isNotEmpty  ]
		because: 'The task cannot be empty.'
		raising: InstanceCreationFailed 
]

{ #category : #'as yet unclassified' }
Note class >> withDescription: aDescription assignedTo: aPerson [

	^ self new 
	initializeWithDescription: aDescription
	assignedTo: aPerson
	openedSince: GregorianCalendar currentDateTime
	closesOn: (Optional unusedBecause: 'There is no end date on instance creation')
	category: (Optional unusedBecause: 'There is no default category')
	status: 'Open'.
]

{ #category : #comparing }
Note >> = aNote [

	^ (self assignee = aNote assignee) and: [ self description = aNote description  ]

]

{ #category : #accessing }
Note >> assignee [
	^ assignee
]

{ #category : #accessing }
Note >> assignee: aPerson [
	^ assignee:= aPerson
]

{ #category : #accessing }
Note >> category [
	^ category
]

{ #category : #accessing }
Note >> category: aCategory [
	category := Optional containing: aCategory
]

{ #category : #'as yet unclassified' }
Note >> changeCategory: aCategory [ 
	self category: aCategory.
]

{ #category : #'as yet unclassified' }
Note >> changeEndDate: aFixedDate [ 
	endDate:= aFixedDate.
]

{ #category : #'as yet unclassified' }
Note >> changeStatus: aStatus [
	self status: aStatus.
]

{ #category : #'as yet unclassified' }
Note >> closesOn [
	^ endDate
]

{ #category : #accessing }
Note >> description [
	^ description
]

{ #category : #'as yet unclassified' }
Note >> initializeWithDescription: aDescription
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
Note >> openedSince [
	^ startDate 
]

{ #category : #printing }
Note >> printOn: aStream [	 
	
	aStream
		nextPutAll: ('<1s>: <2s>'
		expandMacrosWith: self assignee 
		with: self description) .
]

{ #category : #accessing }
Note >> status [
	^ status
]

{ #category : #accessing }
Note >> status: aStatus [
	status := aStatus
]
