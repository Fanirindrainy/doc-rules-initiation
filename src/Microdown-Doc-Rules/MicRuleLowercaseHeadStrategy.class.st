Class {
	#name : 'MicRuleLowercaseHeadStrategy',
	#superclass : 'MicRuleHeaderCheckStrategy',
	#category : 'Microdown-Doc-Rules-Capitalization',
	#package : 'Microdown-Doc-Rules',
	#tag : 'Capitalization'
}

{ #category : 'visiting' }
MicRuleLowercaseHeadStrategy >> checkRest: words of: aMicHeader rule: aRule [
	| stopwords |
	stopwords := aRule unlowercasableText collect: #asLowercase.

	words allButFirst do: [:w |

		"IGNORE STOPWORDS"
		(stopwords includes: w asLowercase)
			ifTrue: [ ^ self ].

		"Word must NOT be capitalized"
		w first isUppercase
			ifTrue: [
				| report |
				report := MicElementOfHeaderIsNotCapitalizeReport new 
					micElement: aMicHeader;
					concern: w;
					yourself.
				report file: aMicHeader fromFile.
				self checker addError: report
				]].
]
