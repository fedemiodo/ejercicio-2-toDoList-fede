Class {
	#name : #ToDoTableView,
	#superclass : #WAPainter,
	#instVars : [
		'toDoTable',
		'toDoQuickAddDescriptionField',
		'toDoQuickAddConfirmButton',
		'toDoQuickAddContainer'
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
ToDoTableView >> initializeToDoQuickAddConfirmButton [

	toDoQuickAddConfirmButton := self componentSupplier
		asynchronicButtonLabeled: 'Create To-Do'
		applying: [ :theButton | theButton beDisabled ].

	toDoQuickAddConfirmButton beIdentifiable
]

{ #category : #initialization }
ToDoTableView >> initializeToDoQuickAddContainer [

	self
		initializeToDoQuickAddConfirmButton;
		initializeToDoQuickAddDescriptionField.

	toDoQuickAddContainer := self componentSupplier
		inlineContainerWrapping: [ :aCanvas | 
			aCanvas
				render: toDoQuickAddDescriptionField;
				render: toDoQuickAddConfirmButton
			]
		applying: [  ]
]

{ #category : #initialization }
ToDoTableView >> initializeToDoQuickAddDescriptionField [

	toDoQuickAddDescriptionField := self componentSupplier
		singleLineTextFieldApplying: [ :theField | theField setPlaceholderTo: 'Write a description...' ].

	toDoQuickAddDescriptionField on trigger
		serializeIt;
		enable: toDoQuickAddConfirmButton
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

	self toDoQuickAddConfirmButtonBehavior.
	
	toDoTable changeContentsTo: self session applicationContext toDoSystem listAllNotes.
	aCanvas
		render: toDoQuickAddContainer;
		render: toDoTable
]

{ #category : #'as yet unclassified' }
ToDoTableView >> toDoQuickAddConfirmButtonBehavior [

	toDoQuickAddConfirmButton on trigger
		disable;
		serverDo: [ | aToDo |

			aToDo := ToDo withDescription: toDoQuickAddDescriptionField model.
			[ self session applicationContext toDoSystem addToDo: aToDo ]
				on: InstanceCreationFailed
				do: [ :error |  ]
			];
		render: self session applicationContext mainView navigationContentWrapper
]
