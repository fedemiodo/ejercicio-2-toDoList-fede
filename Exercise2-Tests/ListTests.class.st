Class {
	#name : #ListTests,
	#superclass : #TestCase,
	#classInstVars : [
		'owner'
	],
	#category : #'Exercise2-Tests'
}

{ #category : #tests }
ListTests >> testAddingAndDeletingToDos [

	| aList aToDo |

	aList := ToDoManagementSystem belongingTo: 'Mercap'.
	aToDo := ToDo withDescription: 'Find the chamaco.'.
	aList addToDo: aToDo.
	self assert: aList listAllNotes size equals: 1.
	self assertCollection: aList listAllNotes hasSameElements: ( Set with: aToDo ).

	aList addToDo: aToDo.
	self assert: aList listAllNotes size equals: 1.
	self assertCollection: aList listAllNotes hasSameElements: ( Set with: aToDo ).

	aList deleteToDo: aToDo.
	self assert: aList listAllNotes size equals: 0.
	self denyCollection: aList listAllNotes hasSameElements: ( Set with: aToDo )
]

{ #category : #tests }
ListTests >> testAddingEqualToDosMultipleTimes [

	| aList aToDo |

	aList := ToDoManagementSystem belongingTo: 'Mercap'.
	aToDo := ToDo withDescription: 'Find the chamaco.'.
	aList addToDo: aToDo.
	aList addToDo: aToDo.
	aList addToDo: aToDo.
	aList addToDo: aToDo.
	
	self assert: aList listAllNotes size equals: 1.
	self assertCollection: aList listAllNotes hasSameElements: ( Set with: aToDo ).
]

{ #category : #tests }
ListTests >> testCategorizeNote [

	| aList |

	aList := ToDoManagementSystem belongingTo: 'Mercap'.
	aList createNote: 'La primer tarea' assignedTo: 'Fede'.

	aList last category withContentDo: [ self fail ] ifUnused: [  ].
	aList last category: 'Urgent'.
	aList last category withContentDo: [  ] ifUnused: [ self fail ].
	self assert: aList last category asString equals: 'Urgent'.

	aList last category: 'Entertainment'.
	aList last category withContentDo: [  ] ifUnused: [ self fail ].
	self assert: aList last category asString equals: 'Entertainment'
]

{ #category : #tests }
ListTests >> testListCreation [
	
	| aList |
	aList := ToDoManagementSystem belongingTo: 'Mercap'.
	
	self assert: aList owner equals: 'Mercap'.	
	self assertCollection: aList listAllNotes hasSameElements: #().
	
]

{ #category : #tests }
ListTests >> testReassignNote [

	| aList |

	aList := ToDoManagementSystem belongingTo: 'Mercap'.
	aList createNote: 'La primer tarea' assignedTo: 'Fede'.
	self assert: aList last assignee equals: 'Fede'.

	aList reassign: 'La primer tarea' to: 'Agus'.
	self assert: aList last assignee equals: 'Agus'
]
