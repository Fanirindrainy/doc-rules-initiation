Class {
	#name : 'MicRules',
	#superclass : 'Object',
	#instVars : [
		'patterns'
	],
	#category : 'Microdown-Doc-Rules',
	#package : 'Microdown-Doc-Rules'
}

{ #category : 'accessing' }
MicRules >> patterns [

	^ patterns
]

{ #category : 'accessing' }
MicRules >> patterns: aCollection [

	patterns := aCollection
]

{ #category : 'accessing' }
MicRules >> prepareForChecking [
	
	^ self
]
