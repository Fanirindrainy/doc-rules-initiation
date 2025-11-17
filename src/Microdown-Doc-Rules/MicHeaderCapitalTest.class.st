Class {
	#name : 'MicHeaderCapitalTest',
	#superclass : 'TestCase',
	#category : 'Microdown-Doc-Rules-Capitalization',
	#package : 'Microdown-Doc-Rules',
	#tag : 'Capitalization'
}

{ #category : 'tests' }
MicHeaderCapitalTest >> testCapitalizedHeaderFullIsCorrectlyCapitalized [

	| r text checker |
	r := MicHeaderCapitalizationRule new.
	r name: 'Header Capitalization'.
	r addDefaultTextThatShouldNotBeCapitalized.
	r shouldVerifyHeadersAreCapitalized.
	
	"here there is a word that should not be uppercase: of so it should 
	not produce an error."
	
	text := Microdown parse: '
# About Capitalisation of Headers		
	'.
	checker := MicRuleHeaderChecker new.
	checker addRule: r.
	checker verifyUppercase. "Duplicated specification we could delegate the strategy setup to the rule"
	checker visit: text. 
	self 
		assert: checker errors size 
		equals: 0.
	
]

{ #category : 'tests' }
MicHeaderCapitalTest >> testCapitalizedHeaderWithoutStopWordsIsCorrectlyCapitalized [

	| r text checker |
	r := MicHeaderCapitalizationRule new.
	r name: 'Header Capitalization'.
	r shouldVerifyHeadersAreCapitalized.
	
	"here there is no stopward that should not be capitalized. 
	So all the elements should be uppercase."
	text := Microdown parse: '
# About Header Capitalisation 		
	'.
	checker := MicRuleHeaderChecker new.
	checker addRule: r.
	checker verifyUppercase. "Duplicated specification we could delegate the strategy setup to the rule"
	checker visit: text. 
	self 
		assert: checker errors size 
		equals: 0.
	
]

{ #category : 'tests' }
MicHeaderCapitalTest >> testHeaderFullIsCorrectlyCapitalized [

	| r text checker |
	r := MicHeaderCapitalizationRule new.
	r name: 'Header Capitalization'.
	r shouldVerifyHeadersAreLowercase.
	
	text := Microdown parse: '
# About capitalisation of headers		
	'.
	checker := MicRuleHeaderChecker new.
	checker addRule: r.
	checker verifyLowercase. "Duplicated specification we could delegate the strategy setup to the rule"
	checker visit: text. 
	self 
		assert: checker errors size 
		equals: 0.
	
]

{ #category : 'tests' }
MicHeaderCapitalTest >> testHeaderFullIsNotCorrectlyCapitalized [

	| r text checker anError |
	r := MicHeaderCapitalizationRule new.
	r name: 'Header Capitalization'.
	r shouldVerifyHeadersAreLowercase.
	
	text := Microdown parse: '
# About capitalisation of Headers		
	'.
	checker := MicRuleHeaderChecker new.
	checker addRule: r.
	checker verifyLowercase. "Duplicated specification we could delegate the strategy setup to the rule"
	checker visit: text. 
	
	self 
		assert: checker errors size 
		equals: 1.
	anError := checker errors first.	
	self 
		assert: anError micElement text
		equals: 'About capitalisation of Headers'.
	
	self 
		assert: anError concern 
		equals: 'Headers'
		
	
]

{ #category : 'tests' }
MicHeaderCapitalTest >> testHeaderFullIsNotCorrectlyCapitalizedStopWords [

	| r text checker anError |
	r := MicHeaderCapitalizationRule new.
	r name: 'Header Capitalization'.
	r shouldVerifyHeadersAreLowercase.
	
	text := Microdown parse: '
# About capitalisation Of headers		
	'.
	checker := MicRuleHeaderChecker new.
	checker addRule: r.
	checker verifyLowercase. "Duplicated specification we could delegate the strategy setup to the rule"
	checker visit: text. 
	
	self 
		assert: checker errors size 
		equals: 1.
	anError := checker errors first.	
	self 
		assert: anError micElement text
		equals: 'About capitalisation Of headers'.
	
	self 
		assert: anError concern 
		equals: 'Of'
		
	
]
