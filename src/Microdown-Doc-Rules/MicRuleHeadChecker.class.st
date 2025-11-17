Class {
	#name : 'MicRuleHeadChecker',
	#superclass : 'MicrodownVisitor',
	#instVars : [
		'rules',
		'errors',
		'strategy'
	],
	#category : 'Microdown-Doc-Rules-Capitalization',
	#package : 'Microdown-Doc-Rules',
	#tag : 'Capitalization'
}

{ #category : 'adding' }
MicRuleHeadChecker >> addError: anError [
	errors add: anError
]

{ #category : 'adding' }
MicRuleHeadChecker >> addRule: aRule [ 
	rules add: aRule.
]

{ #category : 'visiting' }
MicRuleHeadChecker >> checkFirstWord: aCollection of: anElement [
	
	aCollection first isCapitalized 
		ifFalse: [ 
			errors add: (MicFirstElementOfHeaderIsNotCapitalizedReport new 
						micElement: anElement; 
						concern: aCollection first;
						inFile: anElement fromFile)			
						]
]

{ #category : 'visiting' }
MicRuleHeadChecker >> checkRest: words of: aMicHeader [
	
	"In the future we should manage that if a word finishes by : the following one must be captitalized
	e.g., 'Today and tomorrow: The days' and not 
	'Today and tomorrow: the days' 
	"
	
	strategy checkRest: words of: aMicHeader rule: rules first
]

{ #category : 'adding' }
MicRuleHeadChecker >> errors [
	^ errors
]

{ #category : 'initialization' }
MicRuleHeadChecker >> initialize [ 

	super initialize.
	rules := OrderedCollection new. 
	errors := OrderedCollection new.
	self verifyLowercase.
]

{ #category : 'initialization' }
MicRuleHeadChecker >> verifyLowercase [

	strategy := MicRuleLowercaseHeaderStrategy new.
	strategy checker: self
]

{ #category : 'initialization' }
MicRuleHeadChecker >> verifyUppercase [

	strategy := MicRuleUppercaseHeaderStrategy new.
	strategy checker: self
]

{ #category : 'visiting' }
MicRuleHeadChecker >> visitHeader: aMicHeader [

	| words |
	words := aMicHeader text splitOn: Character space.
	self checkFirstWord: words of: aMicHeader. 
	self checkRest: words of: aMicHeader. 

]
