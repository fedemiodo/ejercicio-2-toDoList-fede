Class {
	#name : #BaselineOfToDoList,
	#superclass : #BaselineOf,
	#category : #'BaselineOfExercise2-ToDoList'
}

{ #category : #baselines }
BaselineOfToDoList >> baseline: spec [

	<baseline>
	self setUpDependencies: spec.
	self setUpPackages: spec
]

{ #category : #baselines }
BaselineOfToDoList >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #baselines }
BaselineOfToDoList >> setUpDependencies: spec [

	spec baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6/source' ].
	spec baseline: 'WillowBootstrap' with: [ spec repository: 'github://ba-st/Willow-Bootstrap:v13/source' ].
	spec baseline: 'Chalten' with: [ spec repository: 'github://ba-st/Chalten:v8/source' ].
]

{ #category : #baselines }
BaselineOfToDoList >> setUpPackages: spec [

	spec for: #pharo do: [ 
		spec
			package: 'Exercise2-To-Do-web' with: [ spec requires: #('WillowBootstrap' 'Exercise2-Model') ];
			package: 'Exercise2-Model' with: [ spec requires: #('Buoy' 'Chalten') ];
			package: 'Exercise2-Tests'	with: [ spec requires: 'Exercise2-Model' ] ].
]
