Class {
	#name : 'MicRuleCheckers',
	#superclass : 'Object',
	#instVars : [
		'rules',
		'errors',
		'file',
		'newFile'
	],
	#category : 'Microdown-Doc-Rules',
	#package : 'Microdown-Doc-Rules'
}

{ #category : 'accessing' }
MicRuleCheckers >> addRule: aRule [
	rules add: aRule
]

{ #category : 'accessing' }
MicRuleCheckers >> checkFile: aFileReference [
    | textLower originalText |
    self prepareForChecking.
    originalText := aFileReference readStreamDo: [:s | s contents ].
    textLower := originalText asLowercase.
    rules do: [ :rule |
        rule matchingPatterns do: [ :pattern |
            | patternLower |
            patternLower := pattern asString asLowercase.
            (textLower includesSubstring: patternLower)
                ifTrue: [
                    | report |
                    report := MicUseofWrongVocabularyReport new.
                    report text: originalText;   "on garde le texte original"
                           file: aFileReference;
                           pattern: pattern;
                           rule: rule.
                    errors add: report.
                ].
        ].
    ].
    ^ errors
]

{ #category : 'accessing' }
MicRuleCheckers >> checkText: aString [
    | errs |
    errs := OrderedCollection new.
    rules do: [:rule |
        rule matchingPatterns do: [:pattern |
            (aString includesSubstring: pattern) ifTrue: [
                | report |
                report := MicUseofWrongVocabularyReport new.
                report text: aString;
                       pattern: pattern;
                       rule: rule.
                errs add: report.
            ].
        ].
    ].
    ^ errs
]

{ #category : 'accessing' }
MicRuleCheckers >> correctFileAndSave: aFileReference [
    | original corrected newFile |
    original := aFileReference contents.
    corrected := self correctText: original.
    newFile := aFileReference parent / (aFileReference basename , '_corrected.md').
    newFile writeStreamDo: [:s | s nextPutAll: corrected].
    ^ newFile

]

{ #category : 'accessing' }
MicRuleCheckers >> correctFileInPlace: aFileReference [
	"Remplace directement les mots incorrects dans le fichier"
	| text |
	text := aFileReference contents.
	rules do: [ :rule |
		rule pairs do: [ :pair |
			text := text copyReplaceAll: pair key with: pair value.
		].
	].
	aFileReference writeStreamDo: [ :s | s nextPutAll: text ].
	^ aFileReference.

]

{ #category : 'as yet unclassified' }
MicRuleCheckers >> correctText: aString [
    | corrected |
    corrected := aString.
    rules do: [:rule |
        corrected := rule correctText: corrected
    ].
    ^ corrected
]

{ #category : 'accessing' }
MicRuleCheckers >> errors [
	^ errors
]

{ #category : 'initialization' }
MicRuleCheckers >> initialize [
	super initialize.
	rules := OrderedCollection new.
	errors := OrderedCollection new.
]

{ #category : 'accessing' }
MicRuleCheckers >> prepareForChecking [
    ^ rules
]

{ #category : 'accessing' }
MicRuleCheckers >> proposeCorrectionForFile: aFileReference [
	"Propose un nouveau fichier corrigé sans modifier l’original"
	| text corrected newFile |
	text := aFileReference contents.
	corrected := text.
	rules do: [ :rule |
		rule pairs do: [ :pair |
			corrected := corrected copyReplaceAll: pair key with: pair value.
		].
	].
	newFile := (aFileReference parent / (aFileReference basename , '-corrected.md')).
	newFile writeStreamDo: [ :s | s nextPutAll: corrected ].
	^ newFile.

]

{ #category : 'accessing' }
MicRuleCheckers >> rules: aCollection [
	rules := aCollection.
]
