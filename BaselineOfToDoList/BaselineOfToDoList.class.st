Class {
	#name : #BaselineOfToDoList,
	#superclass : #BaselineOf,
	#category : #BaselineOfToDoList
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

spec baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6/source' ]
]

{ #category : #baselines }
BaselineOfToDoList >> setUpPackages: spec [

	spec for: #pharo do: [ 
		spec
			package: 'Exercise1-Model' with: [ spec requires: 'Buoy' ];
			package: 'Exercise1-Tests'	with: [ spec requires: #( 'Exercise1-Model' ) ] ]
]
