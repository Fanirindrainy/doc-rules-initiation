Class {
	#name : 'MicMisusedVocabularyRules',
	#superclass : 'MicRules',
	#instVars : [
		'name',
		'pairs',
		'matchingPatterns'
	],
	#category : 'Microdown-Doc-Rules',
	#package : 'Microdown-Doc-Rules'
}

{ #category : 'initialization' }
MicMisusedVocabularyRules >> computePatterns [
	patterns := pairs collect: [ :each | each key ].

]

{ #category : 'as yet unclassified' }
MicMisusedVocabularyRules >> correctText: aString [
    | corrected |
    corrected := aString.
    pairs keysAndValuesDo: [:bad :good |
        corrected := corrected copyReplaceAll: bad with: good.
    ].
    ^ corrected
]

{ #category : 'initialization' }
MicMisusedVocabularyRules >> goodWordFor: aString [
	| pair |
	pair := pairs detect: [ :each | each key = aString ] ifNone: [ nil ].
	^ pair ifNotNil: [ pair value ] ifNil: [ aString ]
]

{ #category : 'initialization' }
MicMisusedVocabularyRules >> initialize [
	super initialize.
	pairs := {
		'colour' -> 'color'.
		'behaviour' -> 'behavior'.
		'centre' -> 'center'.
		'visualise' -> 'visualize'.
		'allowed to' -> 'allowed one to'.
		'allows to' -> 'allows one to'
	}.
	self computePatterns.
]

{ #category : 'initialization' }
MicMisusedVocabularyRules >> matchingPatterns [
    ^ pairs keys collect: [:k | k].
]
