Class {
	#name : 'MicRuleLowercaseHeadStrategy',
	#superclass : 'MicRuleHeaderCheckStrategy',
	#category : 'Microdown-Doc-Rules-Capitalization',
	#package : 'Microdown-Doc-Rules',
	#tag : 'Capitalization'
}

{ #category : 'visiting' }
MicRuleLowercaseHeadStrategy >> checkRest: words of: aMicHeader rule: rule [
	"In the future we should manage that if a word finishes by : the following one must be captitalized
	e.g., 'Today and tomorrow: The days' and not 
	'Today and tomorrow: the days' 
	"
	"
	In lowercase mode there is no need to handle stop words since they should always be lowercase (except after : - not managed right now.)
		"
	words allButFirst
		do: [ :word |	
			 word isCapitalized
				ifTrue: [  
				checker addError: (MicElementOfHeaderIsWronglyCapitalizedReport new 
								micElement: aMicHeader; 
								concern: word;
								inFile: aMicHeader fromFile) 
						]
		 ]
]
