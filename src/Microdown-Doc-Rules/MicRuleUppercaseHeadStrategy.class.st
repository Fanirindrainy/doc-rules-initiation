Class {
	#name : 'MicRuleUppercaseHeadStrategy',
	#superclass : 'MicRuleHeaderCheckStrategy',
	#category : 'Microdown-Doc-Rules-Capitalization',
	#package : 'Microdown-Doc-Rules',
	#tag : 'Capitalization'
}

{ #category : 'visiting' }
MicRuleUppercaseHeadStrategy >> checkRest: words of: aMicHeader rule: aRule [
	| stopwords |
	stopwords := aRule uncapitalizableText collect: #asLowercase.

	words allButFirst do: [:w |

		"IGNORE STOPWORDS (same case or not)"
		(stopwords includes: w asLowercase)
			ifTrue: [ ^ self ].

		"Word must be capitalized"
		w first isLowercase
			ifTrue: [
				checker addError: (
					MicElementOfHeaderIsNotCapitalizeReport new
						micElement: aMicHeader;
						concern: w;
						inFile: aMicHeader fromFile) ] ].

]
