Class {
	#name : #ToDoSession,
	#superclass : #WillowSession,
	#instVars : [
		'applicationContext'
	],
	#category : #'Exercise2-To-Do-Web-Application'
}

{ #category : #accessing }
ToDoSession >> applicationContext [

	^ applicationContext
]

{ #category : #Controlling }
ToDoSession >> startUpApplicationContextFor: aToDoApplication [

	super startUpApplicationContextFor: aToDoApplication.
	applicationContext := ToDoApplicationContext workingWith: MainView new.
]
