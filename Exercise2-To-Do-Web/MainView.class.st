Class {
	#name : #MainView,
	#superclass : #WAPainter,
	#instVars : [
		'navigationButtons',
		'initialNavigationContent',
		'navigationContentWrapper'
	],
	#category : #'Exercise2-To-Do-Web-Web Views'
}

{ #category : #'instance creation' }
MainView class >> new [
	
	^ super new initializeContent
]

{ #category : #accessing }
MainView >> initialNavigationContent [

	^ initialNavigationContent 
]

{ #category : #initialization }
MainView >> initializeContent [

	self initializeNavigationContentWrapper.
	navigationButtons := NavigationButtonsView new.
	initialNavigationContent := ToDoTableView new.
]

{ #category : #initialization }
MainView >> initializeNavigationContentWrapper [

	navigationContentWrapper := self componentSupplier
		divisionContainerWrapping: [ :aCanvas | self renderCurrentSubViewOn: aCanvas ]
		applying: [  ].
	navigationContentWrapper beIdentifiable
]

{ #category : #accessing }
MainView >> navigationButtons [
	^ navigationButtons
]

{ #category : #accessing }
MainView >> navigationContentWrapper [

	^ navigationContentWrapper 
]

{ #category : #rendering }
MainView >> renderContentOn: aCanvas [

	aCanvas
		heading: self session applicationContext toDoSystem owner asString;
		render: navigationButtons;
		render: navigationContentWrapper
]

{ #category : #rendering }
MainView >> renderCurrentSubViewOn: aCanvas [

	aCanvas render: self session applicationContext currentContextSubView
]
