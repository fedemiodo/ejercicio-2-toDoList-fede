Class {
	#name : #BaselineOfExercise2,
	#superclass : #BaselineOf,
	#category : #BaselineOfExercise2
}

{ #category : #baselines }
BaselineOfExercise2 >> baseline: spec [

	<baseline>
	self setUpDependencies: spec.
	self setUpPackages: spec
]

{ #category : #baselines }
BaselineOfExercise2 >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #baselines }
BaselineOfExercise2 >> setUpDependencies: spec [

	spec baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6/source' ].
	spec baseline: 'WillowBootstrap' with: [ spec repository: 'github://ba-st/Willow-Bootstrap:v13/source' ].
	spec baseline: 'Chalten' with: [ spec repository: 'github://ba-st/Chalten:v8/source' ].
]

{ #category : #baselines }
BaselineOfExercise2 >> setUpPackages: spec [

	spec for: #pharo do: [ 
		spec
			package: 'Exercise2-To-Do-Web' with: [ spec requires: #('WillowBootstrap' 'Exercise2-Model') ];
			package: 'Exercise2-Model' with: [ spec requires: #('Buoy' 'Chalten') ];
			package: 'Exercise2-Tests'	with: [ spec requires: 'Exercise2-Model' ] ].
]
