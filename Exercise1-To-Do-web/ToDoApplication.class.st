Class {
	#name : #ToDoApplication,
	#superclass : #WillowApplication,
	#instVars : [
		'aList',
		'tasksContainer',
		'taskDescriptionField',
		'addTaskButton',
		'taskEmployeeField',
		'employees',
		'addTasksTable'
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
			aList createNote: taskDescriptionField model assignedTo: taskEmployeeField .
			];
		setValueTo: [ '' ] withoutTriggeringChangeOf: taskDescriptionField;
      render: tasksContainer.
]

{ #category : #accessing }
ToDoApplication >> contentView [

	^ [ :canvas | canvas
			heading: aList owner asString;	
			render: taskEmployeeField;
			render: taskDescriptionField;
			render: addTaskButton;
			render: tasksContainer ]
]

{ #category : #hooks }
ToDoApplication >> initialRequest: request [
	
	super initialRequest: request.
	aList := ToDoList initializeBelongingTo: 'Mercap'.
	aList createNote: 'Ir a comer' assignedTo: 'Fede'.
	aList createNote: 'Ver la TV' assignedTo: 'Fede'.
	aList createNote: 'Prender la tele' assignedTo: 'Marcelo'.
	employees := Employees initializeWith: (Set with: 'Fede' with: 'Edu' with: 'Flor').
	self 
		initializeTaskEmployeeField;
		initializeTaskDescriptionField;
		initializeAddTaskButton;
		initializeTasksContainer;
		configureInteractions.
	

	
]

{ #category : #initialization }
ToDoApplication >> initializeAddTaskButton [

   addTaskButton := self componentSupplier
                     asynchronicButtonLabeled: 'Add task'
                     applying: [ :theButton | theButton beDisabled + (theButton addClass bootstrap3 buttonPrimary) ]
]

{ #category : #initialization }
ToDoApplication >> initializeAddTasksTable [

	addTasksTable := TableWebViewBuilder new 
		addColumn: [ :column | column titled: 'Assignee'; rendering: [ :aNote | aNote assignee  ] ];
		addColumn: [ :column | column titled: 'Description'; rendering: [ :aNote | aNote description ] ];
		addColumn: [ :column | column titled: 'Status'; rendering: [ :aNote | aNote status  ] ];
		addColumn: [ :column | column titled: 'Category'; rendering: [ :aNote | aNote category  ] ];
		addColumn: [ :column | column titled: 'Opened since'; rendering: [ :aNote | aNote openedSince  ] ];
		buildApplying: [ :theTable | theTable addClass bootstrap3 table ].
	addTasksTable changeContentsTo: aList listAllNotes .
]

{ #category : #initialization }
ToDoApplication >> initializeTaskDescriptionField [

	taskDescriptionField := self componentSupplier 
		singleLineTextFieldApplying: [ :theField | theField setPlaceholderTo: 'Write a task description...' ]
]

{ #category : #initialization }
ToDoApplication >> initializeTaskEmployeeField [

	taskEmployeeField := SingleSelectionWebView
		dropDownListApplying: [ :theField | ]
		applyingToOptions: [  ].
		
	taskEmployeeField
		allowAnyOf: employees allEmployees .
]

{ #category : #initialization }
ToDoApplication >> initializeTasksContainer [

	tasksContainer  := TableWebViewBuilder new 
		addColumn: [ :column | column titled: 'Assignee'; rendering: [ :aNote | aNote assignee  ] ];
		addColumn: [ :column | column titled: 'Description'; rendering: [ :aNote | aNote description ] ];
		addColumn: [ :column | column titled: 'Status'; rendering: [ :aNote | aNote status  ] ];
		addColumn: [ :column | column titled: 'Category'; rendering: [ :aNote | aNote category  ] ];
		addColumn: [ :column | column titled: 'Opened since'; rendering: [ :aNote | aNote openedSince  ] ];
		buildApplying: [ :theTable | theTable addClass bootstrap3 table ].
	tasksContainer changeContentsTo: aList listAllNotes .
]

{ #category : #accessing }
ToDoApplication >> jQueryLibrary [

	^ JQuery3OnlineLibrary default  
]
