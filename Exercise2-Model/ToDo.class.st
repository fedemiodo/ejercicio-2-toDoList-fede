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
	#classInstVars : [
		'possibleStatuses'
	],
	#category : #'Exercise2-Model'
}

{ #category : #asserting }
ToDo class >> assertIsValidDescription: aDescription [
	
	AssertionChecker 
		enforce: [ aDescription isNotEmpty  ]
		because: 'The task cannot be empty.'
		raising: InstanceCreationFailed 
]

{ #category : #'instance creation' }
ToDo class >> withDescription: aDescription [

	self assertIsValidDescription: aDescription.

	^ self new
		initializeWithDescription: aDescription
		assignedTo: ( Optional unusedBecause: 'Not yet assigned.' )
		openedSince: GregorianCalendar currentDateTime
		closesOn: ( Optional unusedBecause: 'Not yet assigned.' )
		category: ( Optional unusedBecause: 'Not yet assigned.' )
		status: 'Open'
]

{ #category : #'instance creation' }
ToDo class >> withDescription: aDescription assignedTo: anEmployeeName [

	self assertIsValidDescription: aDescription.

	^ self new
		initializeWithDescription: aDescription
		assignedTo: ( Optional containing: anEmployeeName )
		openedSince: GregorianCalendar currentDateTime
		closesOn: ( Optional unusedBecause: 'Not yet assigned.' )
		category: ( Optional unusedBecause: 'Not yet assigned.' )
		status: 'Open'
]

{ #category : #comparing }
ToDo >> = aNote [

	^ self description = aNote description
]

{ #category : #accessing }
ToDo >> assignee [
	^ assignee
]

{ #category : #accessing }
ToDo >> category [
	^ category
]

{ #category : #accessing }
ToDo >> changeAssignee: aPersonName [
	
	assignee := Optional containing: aPersonName 
]

{ #category : #accessing }
ToDo >> changeCategory: aCategory [
	category := Optional containing: aCategory
]

{ #category : #'as yet unclassified' }
ToDo >> changeEndDate: anEndDate [ 
	endDate:= Optional containing: anEndDate.
]

{ #category : #accessing }
ToDo >> changeStatus: aStatus [
	status := aStatus
]

{ #category : #accessing }
ToDo >> closingDate [
	^ endDate
]

{ #category : #accessing }
ToDo >> description [
	^ description
]

{ #category : #initialization }
ToDo >> initializeWithDescription: aDescription
assignedTo: aPersonName
openedSince: aStartingDate
closesOn: aClosingDate
category: aCategory
status: aStatus [

description:= aDescription.
assignee:= aPersonName.
startDate:= aStartingDate.
endDate:= aClosingDate.
category:= aCategory.
status:= aStatus .

]

{ #category : #accessing }
ToDo >> openedSince [
	^ startDate 
]

{ #category : #printing }
ToDo >> printOn: aStream [

	aStream nextPutAll: ('<1s>: <2s>' expandMacrosWith: self assignee with: self description)
]

{ #category : #accessing }
ToDo >> status [
	^ status
]
