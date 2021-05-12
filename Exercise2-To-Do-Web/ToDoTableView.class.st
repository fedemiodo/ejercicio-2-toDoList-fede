Class {
	#name : #ToDoTableView,
	#superclass : #WAPainter,
	#instVars : [
		'toDoTable',
		'toDoQuickAdd',
		'toDoQuickAddDescriptionField',
		'toDoQuickAddConfirmButton'
	],
	#category : #'Exercise2-To-Do-Web-Web Views'
}

{ #category : #initialization }
ToDoTableView >> initialize [

	self
		initializeToDoQuickAddContainer;
		initializeToDoTable
]

{ #category : #initialization }
ToDoTableView >> initializeToDoQuickAddContainer [

	self
		initializeToDoQuickAddDescriptionField;
		initializeToDoQuickAddConfirmButton.
	
	toDoQuickAdd := self componentSupplier
		divisionContainerWrapping: [ :aCanvas | 
			aCanvas
				render: toDoQuickAddDescriptionField;
				render: toDoQuickAddConfirmButton
			]
		applying: [  ]
]

{ #category : #'initialization-toDoTableView' }
ToDoTableView >> initializeToDoTable [

	toDoTable := TableWebViewBuilder new 
		addColumn: [ :column | column titled: 'Assignee'; rendering: [ :aNote | aNote assignee  ] ];
		addColumn: [ :column | column titled: 'Description'; rendering: [ :aNote | aNote description ] ];
		addColumn: [ :column | column titled: 'Status'; rendering: [ :aNote | aNote status  ] ];
		addColumn: [ :column | column titled: 'Category'; rendering: [ :aNote | aNote category  ] ];
		addColumn: [ :column | column titled: 'Opened since'; rendering: [ :aNote | aNote openedSince  ] ];
		addColumn: [ :column | column titled: 'Closes on'; rendering: [ :aNote | aNote closingDate   ] ];
		buildApplying: [ :theTable | theTable addClass bootstrap3 table ].
	
]

{ #category : #rendering }
ToDoTableView >> renderContentOn: aCanvas [

	toDoTable changeContentsTo: self session applicationContext toDoSystem listAllNotes.
	aCanvas render: toDoTable
]
