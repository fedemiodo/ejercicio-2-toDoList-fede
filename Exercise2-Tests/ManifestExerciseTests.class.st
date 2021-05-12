"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestExerciseTests,
	#superclass : #PackageManifest,
	#category : #'Exercise2-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestExerciseTests class >> ruleGRParensFormattingRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#ListTests #testAddingAndDeletingToDos #false)) #'2021-05-10T13:24:10.405206-03:00') )
]
