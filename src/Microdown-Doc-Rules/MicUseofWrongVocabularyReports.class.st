Class {
	#name : 'MicUseofWrongVocabularyReports',
	#superclass : 'Object',
	#instVars : [
		'text',
		'pattern',
		'file',
		'rule'
	],
	#category : 'Microdown-Doc-Rules',
	#package : 'Microdown-Doc-Rules'
}

{ #category : 'accessing' }
MicUseofWrongVocabularyReports >> explain [
    | wrongWord goodWord |
    wrongWord := pattern.
    goodWord := rule goodWordFor: wrongWord.
    ^ 'Text: ', text, ' in file ', file name, ' contains a mistake: ', pattern, ' should not be used. Use ', goodWord, '.'

]

{ #category : 'accessing' }
MicUseofWrongVocabularyReports >> file [

	^ file
]

{ #category : 'accessing' }
MicUseofWrongVocabularyReports >> file: aFile [

	file := aFile
]

{ #category : 'accessing' }
MicUseofWrongVocabularyReports >> pattern [

	^ pattern
]

{ #category : 'accessing' }
MicUseofWrongVocabularyReports >> pattern: aPattern [

	pattern := aPattern
]

{ #category : 'accessing' }
MicUseofWrongVocabularyReports >> rule [

	^ rule
]

{ #category : 'accessing' }
MicUseofWrongVocabularyReports >> rule: aRule [

	rule := aRule
]

{ #category : 'accessing' }
MicUseofWrongVocabularyReports >> text [

	^ text
]

{ #category : 'accessing' }
MicUseofWrongVocabularyReports >> text: aText [

	text := aText
]
