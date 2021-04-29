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
		'addTasksTable',
		'currentEmployeeSelection',
		'theTasksTable',
		'editTableButtons',
		'editTableButton',
		'confirmChangesButton',
		'createNoteContainer',
		'editTableButtonsContainer',
		'theTasksTableEditionMode',
		'currentTableView',
		'currentTableViewNumber',
		'possibleTableViews',
		'dropdownForAssignee',
		'cancelChangesButton'
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

	^ Bootstrap3ComponentSupplier
		withBootstrapLibrary: (self deploymentMode libraryFor: Bootstrap3MetadataLibrary) withoutOptionalTheme
		selectLibrary: ((self deploymentMode libraryFor: BootstrapSelectLibrary) using: self language)
		datepickerLibrary: ((self deploymentMode libraryFor: BootstrapDatepickerLibrary) using: self language)
		typeaheadLibrary: (self deploymentMode libraryFor: BootstrapTypeaheadLibrary) new
]

{ #category : #initialization }
ToDoApplication >> configureInteractions [

	taskDescriptionField on trigger
      serializeIt;
      enable: addTaskButton.

	taskEmployeeField on trigger 
		serializeIt.

	addTaskButton on trigger
		disable;
      serverDo:
			[
			aList createNote: taskDescriptionField model assignedTo: taskEmployeeField currentSelection .
			theTasksTable changeContentsTo: aList listAllNotes .
			];
		setValueTo: [ '' ] withoutTriggeringChangeOf: taskDescriptionField;
		render:  currentTableView .
	
	
]

{ #category : #initialization }
ToDoApplication >> configureTaskTableInteractions [
	
	editTableButton on trigger
		disable;
		enable: confirmChangesButton;
		enable: cancelChangesButton;
		serverDo:
		[
			self swapCurrentTableViewNumber.
		];
		render: currentTableView.
		
	cancelChangesButton on trigger
		disable;
		enable: editTableButton;
		disable: confirmChangesButton;
		serverDo:
		[
			self swapCurrentTableViewNumber.
		];
		render: currentTableView.
	
	confirmChangesButton on trigger
		disable;
		enable: editTableButton;
		disable: cancelChangesButton;
		serverDo:
		[
			self swapCurrentTableViewNumber.
		];
		render: currentTableView.
]

{ #category : #accessing }
ToDoApplication >> contentView [

	^ [ :canvas | canvas
			heading: aList owner asString;	
			render: createNoteContainer;
			render: currentTableView;
			render: editTableButtonsContainer
		]
]

{ #category : #hooks }
ToDoApplication >> initialRequest: request [
	| anotherList |
	super initialRequest: request.
	aList := ToDoList initializeBelongingTo: 'Mercap'.
	aList createNote: 'Ir a comer' assignedTo: 'Fede'.
	aList createNote: 'Ver la TV' assignedTo: 'Fede'.
	aList createNote: 'Prender la tele' assignedTo: 'Marcelo'.
	employees := Employees initializeWith: (Set with: 'Fede' with: 'Edu' with: 'Flor').
	
	anotherList := ToDoList initializeBelongingTo: 'Mercap'.
	anotherList createNote: 'Volver de comer' assignedTo: 'Fede'.
	anotherList createNote: 'Realizar nudos náuticos' assignedTo: 'Arbust'.
	
	self 
		initializeCreateNoteContainer;
		initializePossibleTableViews;
		initializeCurrentTableViewNumber;
		initializeCurrentTableView;
		initializeEditTableButtonsContainer;
		configureInteractions;
		configureTaskTableInteractions.
]

{ #category : #initialization }
ToDoApplication >> initializeAddTaskButton [

   addTaskButton := self componentSupplier
                     asynchronicButtonLabeled: 'Add task'
                     applying: [ :theButton | theButton beDisabled + (theButton addClass bootstrap3 buttonPrimary) ]
]

{ #category : #initialization }
ToDoApplication >> initializeCancelChangesButton [

	cancelChangesButton := self componentSupplier
								asynchronicButtonLabeled: 'Cancel'
								applying: [ :theButton | theButton beDisabled + (theButton addClass bootstrap3 buttonDefault) ].
	
	cancelChangesButton beIdentifiable.
		
]

{ #category : #initialization }
ToDoApplication >> initializeConfirmChangesButton [

	confirmChangesButton := self componentSupplier
								asynchronicButtonLabeled: 'Confirm'
								applying: [ :theButton | theButton beDisabled + (theButton addClass bootstrap3 buttonDefault) ].

	confirmChangesButton beIdentifiable.
]

{ #category : #initialization }
ToDoApplication >> initializeCreateNoteContainer [

	self
		initializeTaskEmployeeField;
		initializeTaskDescriptionField;
		initializeAddTaskButton.
		
	createNoteContainer := self componentSupplier 
		gridBuilder
			columnsPerRow: 3;
			columnsWidths: #(1 5 6);
			addContent: taskEmployeeField;
			addContent: taskDescriptionField;
			addContent: addTaskButton;
			build
]

{ #category : #initialization }
ToDoApplication >> initializeCurrentTableView [

	currentTableView := self componentSupplier
		divisionContainerWrapping: [ :canvas | self renderCurrentTableOn: canvas ]
		applying: [ :div | ].
	currentTableView beIdentifiable
]

{ #category : #initialization }
ToDoApplication >> initializeCurrentTableViewNumber [
	
	currentTableViewNumber := 1

]

{ #category : #initialization }
ToDoApplication >> initializeDropdownForAssignee [
	
	dropdownForAssignee := SingleSelectionWebView
		dropDownListApplying: [ :theField |  ]
		applyingToOptions: [  ].
		
	dropdownForAssignee
		allowAnyOf: employees allEmployees .
]

{ #category : #initialization }
ToDoApplication >> initializeEditTableButton [

	editTableButton := self componentSupplier
								asynchronicButtonLabeled: 'Edit'
								applying: [ :theButton | theButton addClass bootstrap3 buttonPrimary ].
	editTableButton beIdentifiable.	
	
]

{ #category : #initialization }
ToDoApplication >> initializeEditTableButtonsContainer [

	self
		initializeEditTableButton;
		initializeCancelChangesButton;
		initializeConfirmChangesButton.
	
	editTableButtonsContainer := self componentSupplier 
		inlineContainerWrapping: 
			[	:canvas | canvas
					render: editTableButton;
					render: cancelChangesButton;
					render: confirmChangesButton
			]
		applying: [  ].
	editTableButtonsContainer beIdentifiable .
]

{ #category : #initialization }
ToDoApplication >> initializePossibleTableViews [
	
	possibleTableViews := OrderedCollection new
		add: self initializeTasksTable;
		add: self initializeTasksTableEditionMode;
		yourself.

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

	tasksContainer  := self componentSupplier 
		divisionContainerWrapping: [ :canvas | canvas renderCurrentTableOn: canvas ]
	applying: [ :theDiv | ].
	
]

{ #category : #initialization }
ToDoApplication >> initializeTasksTable [

	theTasksTable := TableWebViewBuilder new 
		addColumn: [ :column | column titled: 'Assignee'; rendering: [ :aNote | aNote assignee  ] ];
		addColumn: [ :column | column titled: 'Description'; rendering: [ :aNote | aNote description ] ];
		addColumn: [ :column | column titled: 'Status'; rendering: [ :aNote | aNote status  ] ];
		addColumn: [ :column | column titled: 'Category'; rendering: [ :aNote | aNote category  ] ];
		addColumn: [ :column | column titled: 'Opened since'; rendering: [ :aNote | aNote openedSince  ] ];
		addColumn: [ :column | column titled: 'Closes on'; rendering: [ :aNote | aNote closesOn   ] ];
		buildApplying: [ :theTable | theTable addClass bootstrap3 table ].
	theTasksTable changeContentsTo: aList listAllNotes.
	^ theTasksTable
	
]

{ #category : #initialization }
ToDoApplication >> initializeTasksTableEditionMode [

	self
		initializeDropdownForAssignee.	
	theTasksTableEditionMode := TableWebViewBuilder new 
		addColumn: [ :column | column titled: 'Assignee'; rendering: [ dropdownForAssignee ] ];
		addColumn: [ :column | column titled: 'Description'; rendering: [ :aNote | aNote description ] ];
		addColumn: [ :column | column titled: 'Status'; rendering: [ :aNote | aNote status  ] ];
		addColumn: [ :column | column titled: 'Category'; rendering: [ :aNote | aNote category  ] ];
		addColumn: [ :column | column titled: 'Opened since'; rendering: [ :aNote | aNote openedSince  ] ];
		addColumn: [ :column | column titled: 'Closiquwhdqiwu on'; rendering: [ :aNote | aNote closesOn   ] ];
		buildApplying: [ :theTable | theTable addClass bootstrap3 table ].
	theTasksTableEditionMode changeContentsTo: aList listAllNotes.
	^ theTasksTableEditionMode 
]

{ #category : #accessing }
ToDoApplication >> jQueryLibrary [

	^ JQuery3OnlineLibrary default  
]

{ #category : #rendering }
ToDoApplication >> renderCurrentTableOn: aCanvas [

	| view |

	view := possibleTableViews at: currentTableViewNumber.
	aCanvas div with: view applying: [ :div | ].

]

{ #category : #initialization }
ToDoApplication >> swapCurrentTableViewNumber [

	(currentTableViewNumber = 1)
		ifTrue: [ ^ currentTableViewNumber := 2 ]
		ifFalse: [ ^ currentTableViewNumber := 1 ]
]
