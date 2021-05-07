Class {
	#name : #ToDoApplication,
	#superclass : #WillowApplication,
	#category : #'Exercise2-To-Do-Web-Application'
}

{ #category : #accessing }
ToDoApplication class >> applicationTitle [
	
	^ 'To Do List'
]

{ #category : #accessing }
ToDoApplication class >> handlerName [

	^ 'to-do'
]

{ #category : #accessing }
ToDoApplication class >> sessionClass [

	^ ToDoSession
]

{ #category : #'system startup' }
ToDoApplication class >> startUp [

	(ZnZincServerAdaptor port: 9090) start.
	self registerAsDevelopmentApplication.
]

{ #category : #'system startup' }
ToDoApplication class >> stop [

	ZnServer stopDefault.
	ZnZincServerAdaptor allInstancesDo: [ :each | each shutDown ].
	ToDoApplication unregisterFromApplications.
	Smalltalk garbageCollect.
]

{ #category : #accessing }
ToDoApplication >> componentSupplierForApplication [

	^ Bootstrap3ComponentSupplier
		withBootstrapLibrary: (self deploymentMode libraryFor: Bootstrap3MetadataLibrary) withoutOptionalTheme
		selectLibrary: ((self deploymentMode libraryFor: BootstrapSelectLibrary) using: self language)
		datepickerLibrary: ((self deploymentMode libraryFor: BootstrapDatepickerLibrary) using: self language)
		typeaheadLibrary: (self deploymentMode libraryFor: BootstrapTypeaheadLibrary) new
]

{ #category : #accessing }
ToDoApplication >> contentView [
	
	^	self session applicationContext identifiedMainView
]

{ #category : #accessing }
ToDoApplication >> jQueryLibrary [

	^ JQuery3OnlineLibrary default  
]
