Class {
	#name : #ToDoApplication,
	#superclass : #WillowApplication,
	#instVars : [
		'aList',
		'tasksContainer',
		'taskDescriptionField',
		'addTaskButton',
		'taskEmployeeField'
	],
	#category : #'Exercise1-To-Do-web'
}

{ #category : #accessing }
ToDoApplication class >> applicationTitle [
	
	^ 'To Do List'
]

{ #category : #accessing }
ToDoApplication class >> handlerName [

	^ 'to-do'
]

{ #category : #'system startup' }
ToDoApplication class >> startUp [

	(ZnZincServerAdaptor port: 8080) start.
	self registerAsDevelopmentApplication.
]

{ #category : #accessing }
ToDoApplication >> componentSupplierForApplication [

	^ Html5ComponentSupplier new
]

{ #category : #initialization }
ToDoApplication >> configureInteractions [

   taskDescriptionField on trigger
      serializeIt;
      enable: addTaskButton.

	addTaskButton on trigger
		disable;
      serverDo:
			[
			aList createNote: taskDescriptionField model assignedTo: taskEmployeeField model.
			tasksContainer := aList listAllNotes.
			];
		setValueTo: [ '' ] withoutTriggeringChangeOf: taskDescriptionField;
		setValueTo: [ '' ] withoutTriggeringChangeOf: taskEmployeeField;
      render: tasksContainer
]

{ #category : #accessing }
ToDoApplication >> contentView [

	^ [ :canvas | canvas
			heading: aList owner asString;	
			render: tasksContainer;
			render: taskDescriptionField;
			render: taskEmployeeField;
         render: addTaskButton ]
]

{ #category : #hooks }
ToDoApplication >> initialRequest: request [
	
	super initialRequest: request.
	aList := ToDoList initializeBelongingTo: 'Mercap'.
	self 
		initializeTasksContainer;
		initializeTaskDescriptionField;
		initializeTaskEmployeeField;
		initializeAddTaskButton;
		configureInteractions.
	

	
]

{ #category : #initialization }
ToDoApplication >> initializeAddTaskButton [

   addTaskButton := self componentSupplier
                     asynchronicButtonLabeled: 'Add task'
                     applying: [ :theButton | theButton beDisabled ]
]

{ #category : #initialization }
ToDoApplication >> initializeTaskDescriptionField [

	taskDescriptionField := self componentSupplier 
		singleLineTextFieldApplying: [ :theField | theField setPlaceholderTo: 'Write a task description...' ]
]

{ #category : #initialization }
ToDoApplication >> initializeTaskEmployeeField [

	taskEmployeeField := self componentSupplier 
		singleLineTextFieldApplying: [ :theField | theField setPlaceholderTo: 'Assign to an employee...' ]
]

{ #category : #initialization }
ToDoApplication >> initializeTasksContainer [

	tasksContainer := self componentSupplier 
		divisionContainerWrapping: [ :canvas | canvas unorderedList: aList listAllNotes  ]
		applying: [  ]
]

{ #category : #accessing }
ToDoApplication >> jQueryLibrary [

	^ JQuery3OnlineLibrary default  
]
