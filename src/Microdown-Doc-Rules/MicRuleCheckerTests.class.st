Class {
	#name : 'MicRuleCheckerTests',
	#superclass : 'TestCase',
	#instVars : [
		'checker',
		'file'
	],
	#category : 'Microdown-Doc-Rules',
	#package : 'Microdown-Doc-Rules'
}

{ #category : 'running' }
MicRuleCheckerTests >> setUp [
    super setUp.
    checker := MicRuleChecker new.
    checker addRule: MicMisusedVocabularyRule new.
    "Créer un fichier temporaire pour test"
    file := FileSystem workingDirectory / 'example_with_mistake.md'.
    file writeStreamDo: [:s | 
        s nextPutAll: 'The colour of the centre has weird behaviour.'].
]

{ #category : 'running' }
MicRuleCheckerTests >> testCorrectsWrongVocabulary [
    | correctedFile |
    correctedFile := checker correctFileAndSave: file.
    self assert: correctedFile exists.
    self assert: correctedFile contents equals: 'The color of the center has weird behavior.'.

]

{ #category : 'running' }
MicRuleCheckerTests >> testDetectsWrongVocabulary [
    | errors |
    errors := checker checkText: (file contents).
    self assert: errors size equals: 3.
    self assert: (errors anySatisfy: [:e | e pattern = 'colour']).
    self assert: (errors anySatisfy: [:e | e pattern = 'centre']).
    self assert: (errors anySatisfy: [:e | e pattern = 'behaviour']).
]
