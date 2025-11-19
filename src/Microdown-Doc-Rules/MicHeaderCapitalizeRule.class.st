Class {
	#name : 'MicHeaderCapitalizeRule',
	#superclass : 'MicRule',
	#instVars : [
		'headersAreLowercase',
		'uncapitalizableText',
		'unlowercasableText',
		'ifAddDefaultNotCapitalized'
	],
	#category : 'Microdown-Doc-Rules-Capitalization',
	#package : 'Microdown-Doc-Rules',
	#tag : 'Capitalization'
}

{ #category : 'stop words' }
MicHeaderCapitalizeRule >> addDefaultTextThatShouldNotBeCapitalized [
	
	ifAddDefaultNotCapitalized 
		ifTrue: [ 
			uncapitalizableText addAll: self defaultTextThatShouldNotBeCapitalized ]
]

{ #category : 'stop words' }
MicHeaderCapitalizeRule >> defaultTextThatShouldNotBeCapitalized [

	^ #( 'a' 'an' 'both' 'the' 'and' 'as' 'at' 'but' 'by' 'down'
	     'for' 'from' 'if' 'in' 'into' 'like' 'near' 'nor' 'of' 'off'
	     'on' 'one' 'once' 'onto' 'or' 'over' 'past' 'so' 'than' 'that' 'to'
	     'upon' 'when' 'with' 'yet' ) 
]

{ #category : 'asserting' }
MicHeaderCapitalizeRule >> headersAreLowerCase [
	
	^ headersAreLowercase 
]

{ #category : 'stop words' }
MicHeaderCapitalizeRule >> ifAddDefaultNotCapitalized [

	^ ifAddDefaultNotCapitalized
]

{ #category : 'stop words' }
MicHeaderCapitalizeRule >> ifAddDefaultNotCapitalized: anObject [

	ifAddDefaultNotCapitalized := anObject
]

{ #category : 'initialization' }
MicHeaderCapitalizeRule >> initialize [

	super initialize.
	uncapitalizableText := OrderedCollection new.
	unlowercasableText := OrderedCollection new. 
	ifAddDefaultNotCapitalized := true
]

{ #category : 'asserting' }
MicHeaderCapitalizeRule >> shouldVerifyHeadersAreCapitalized [

	headersAreLowercase := false
]

{ #category : 'asserting' }
MicHeaderCapitalizeRule >> shouldVerifyHeadersAreLowercase [

	headersAreLowercase := true
]

{ #category : 'stop words' }
MicHeaderCapitalizeRule >> uncapitalizableText [
	
	^ uncapitalizableText 
	
]

{ #category : 'stop words' }
MicHeaderCapitalizeRule >> unlowercasableText [
	
	^ unlowercasableText 
	
]
