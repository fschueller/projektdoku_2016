# Einleitung

# Projektinitialisierung

## Projektbeschreibung

  - web application for management of access rights to external
  applications used by SUSE developers within daily work
  - centralized database mapping of employees and their external aliases
  to facilitate checks and creating reports to maintain a membership
  record mapping current employee status

## Projektumfeld
  - SUSE Linux GmbH (key numbers, fields of operation)

## Projektschnittstellen
  - Github
  - Trello
  - etsync

## Ist-Analyse
  - manual comparison of member lists, aliases, etc.
  - high amount of effort to create reports and maintenance
  - usage of version management services, namely Github
  - usage of scrum tools like Trello
  - ^ approved by BR
  - external services which are not maintained by SUSE,
  employees mostly carry "private" accounts used for
  professional work
  - therefore SUSE organizations need to be checked for
  employee membership in order to maintain compliant access
  management and to be able to track contributions

## Soll-Konzept

  - web application as a self-service tool for employees
  to maintain their user record and aliases
  - API for administrators to generate reports and checks about
  membership in organizations

# Projektplanung

## Zeitplanung

  - cmp. from proposal

## Ressourcenplanung

  - development, tests and build running on local machine
  - no additional hardware necessary

## Entwicklungsprozess
  - Agile
  - Test driven development (explanation)
  - Ruby on Rails as requested
  - MVC as requested

## Personal

  - single developer, trainee

## Architekturdesign
  - MVC

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

## Paketierung

  - rpm with all dependencies installable on (SLES12) production machine

# Implementierung

## Einleitung

## Implementierung des Backends
  - employee view
  - admin view
  - active record, solved by using single table inheritance as models are
  related and share most of the attributes
  - separate tables for employees and administrators prevent access and
  security issues (can only be changed from production node and not by setting
  a flag (Rails mechanism: type-attribute triggers STI))
  - `code examples go here`

## Middleware/Konnektoren
  - Github Octokit API
  - Trello API
  - `code examples go here`

## Implementierung der Benutzeroberfläche
  - employee view
  - admin view
  - team lead view
  - Twitter Bootstrap
  - `code examples go here`

## Interne API

  - JSON
  - export of aliases, github, trello aliases
  - query with etsync
  - `code examples go here`

## Testing

  - with internal data and test suite, usability tests
  - `code examples go here`

## Paketierung

  - packaged for SLE12 with all dependencies

## Deployment

  - deployed together with SUSE IT team

# Projektabschluss

## Abnahme
  - presentation/demonstration for stakeholders, minor fixes

## Firmenweite Einführung

  - Announcement on internal mailing lists via project supervisor
  - regular reminders for current and new employees to maintain their
    records

# Dokumentation

## Benutzerdokumentation

  - > excerpt from document

## Entwicklerdokumentation?

## Projektdokumentation

# Fazit

## Ausblick

## Glossar

## Literaturverzeichnis

## Abbildungsverzeichnis
