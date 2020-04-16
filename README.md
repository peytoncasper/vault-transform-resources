# What is this?
Vault Enterprise introduced a feature called the Transform Engine. The Transform Engine allows users to utilize Vault to perform Format Preserving Encryption and Masking with the use of Regex Patterns and various UTF-8 Alphabets. This repository is an attempt at collecting various regex patterns for things like SSNs, Driver License Numbers and more to prevent duplicative work. In addition, there is an alphabets section which is an attempt to source valid UTF-8 alphabets for various languages.

# How to Use

## Loading an Alphabet

1. Type: What type of file are we loading. (alphabet/template)
2. Path: File path to the alphabet. (alphabet/*)
3. Name: Name of the alphabet when stored in Vault. 

`./load.sh alphabet alphabet/english/alphabet.txt english-alphabet`

## Loading a Template

This requires 4 parameters

1. Type: What type of file are we loading. (alphabet/template)
2. Path: File path to the regex pattern. (templates/*)
3. Name: Name of the template when stored in Vault
4. Alphabet: Templates require a supporting Alphabet that is registered within Vault. This could be tha name of an Alphabet previously loaded or an alphabet that is already stored in Vault.

`./load.sh template template/driver-license/us/georgia.txt georgia-dl numerics`