# Einleitung

## Projektbeschreibung

  - web application for management of access rights to external
  applications used by SUSE developers within daily work
  - centralized database mapping of employees and their external aliases
  to facilitate checks and creating reports to maintain a membership
  record mapping current employee status

## Projektziel

  - web application as a self-service tool for employees
  to maintain their user record and aliases
  - API for administrators to generate reports and checks about
  membership in organizations

## Projektumfeld
  - SUSE Linux GmbH (key numbers, fields of operation)

## Projektbegründung
  - usage of version management services, namely Github
  - usage of scrum tools like Trello
  - external services which are not maintained by SUSE,
  employees mostly carry "private" accounts used for
  professional work
  - therefore SUSE organizations need to be checked for
  employee membership in order to maintain compliant access
  management
## Projektschnittstellen
  - Github
  - Trello
  - etsync

# Projektplanung

## Phasen
## Kosten-/Ressourcenplanung
## Entwicklungsprozess
  - Agile?
  - Test driven development (explanation)

# Analysephase

## Ist-Zustand
  - manual comparison of member lists, aliases, etc.
  - high amount of effort to create reports and maintenance
## Wirtschaftlichkeit
  - high amount of extra work and time for team leads and owners

## Lastenheft
  - >excerpt from document<

# Entwurfsphase

## Architekturdesign
  - MVC (requested)

## Zielplattform
  - Ruby on Rails (web application, Active Record...)
  - easy implementation, easy to configure and deploy

## Benutzeroberfläche
  - Twitter Bootstrap, HTML/CSS
  - basically drop-in solution

## Datenmodell (?)
  - Active Record, User - Employee - Admin, Tool - Github - Trello)
  - Users split into Employee and administrators
  - Tools split into Github and Trello
  - inheritance

## Rechteverteilung
  - employee access: maintenance of personal record
  - admin access: maintenance of personal record and access to all complete
  data records and API

## Schnittstellen
  - API for reporting tool etsync

## Pflichtenheft
  - >excerpt from document<

# Projektdurchführung/Implementierung

## Implementierung der Datenstrukturen
  - employee view
  - admin view
  - active record, solved by using single table inheritance as models are
  related and share most of the attributes
  - separate tables for employees and administrators prevent access and
  security issues (can only be changed from production node and not by setting
  a flag (Rails mechanism: type-attribute triggers STI))

## Implementierung der Benutzeroberfläche
  - employee view
  - admin view
  - team lead view

# Projektabschluss

## Abnahme
  - presentation/demonstration for stakeholders, minor fixes
## Deployment/Einführung
  - deployment in cooperation with infrastructure team

# Dokumentation

## Benutzerdokumentation

  - > excerpt from document

## Entwicklerdokumentation?

# Fazit

## Ausblick

## Glossar

## Literaturverzeichnis

## Abbildungsverzeichnis
