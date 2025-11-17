Class {
	#name : 'MicReports',
	#superclass : 'Object',
	#instVars : [
		'file',
		'rule',
		'text',
		'concern'
	],
	#category : 'Microdown-Doc-Rules-Capitalization',
	#package : 'Microdown-Doc-Rules',
	#tag : 'Capitalization'
}

{ #category : 'accessing' }
MicReports >> concern [

	^ concern
]

{ #category : 'accessing' }
MicReports >> concern: aString [ 

	concern := aString 
]

{ #category : 'accessing' }
MicReports >> file [

	^ file
]

{ #category : 'accessing' }
MicReports >> file: aFileReference [

	file := aFileReference
]

{ #category : 'accessing' }
MicReports >> micElement [
	^ text
]

{ #category : 'accessing' }
MicReports >> micElement: aMicText [

	text := aMicText 
]

{ #category : 'accessing' }
MicReports >> rule [

	^ rule
]

{ #category : 'accessing' }
MicReports >> rule: aRule [

	rule := aRule
]

{ #category : 'accessing' }
MicReports >> text [

	^ text
]
