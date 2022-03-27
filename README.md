
# colours
A collection of colours (and elements) for automated test purposes

# What?
It's a simple website consisting of text, links, input boxes, buttons and well, colours.  It is a content platform used for building different sets of automated test frameworks.  colours was developed by jimjamz.

# Why?
To be used as a portfolio for demonstrating the different kinds of automated test frameworks I am familiar with.

# How?
Each different type of automated test framework will be held within its own feature branch of this project.  The `master` branch contains all the latest and up-to-date UI (and possibly later, API) elements that the test frameworks will use (and interact with) to run their tests against.  As new elements are added and existing ones are modified, these changes are merged with the downstream feature branch.  The framework's existing tests will then (expectedly) fail, needing to be be reworked to accommodate the new UI changes.

# Installation
Choose the desired automated test framework by selecting the appropriate branch.  Follow the [documentation](./doc/doc.html) within that branch to set up the dependencies.

# Branches
`master` : Contains the latest and up-to-date elements of the project to design, build and run tests against.  All changes will be merged downstream into the feature branches for the test branch to accommodate.

## Test branches
`rspec` : A separate branch used to demonstrate unit testing techniques from a behaviour driven approach using RSpec.

`cucumber` : All the latest behaviour designs are located here and are to be adopted by all other test frameworks.  This is done by merging all changes downstream to feature branches containing an automated test framework capable of supporting Behaviour Driven Development (BDD) tools.

`cucumber-jvm` : A Java implementation of BDD tests using Cucumber JVM for a Java-based Colours application.

`capybara` : Tests that are written using the Capybara DSL and Ruby to simulate UI acceptance tests.

`siteprism` : Similar to the `capybara` branch but using the Page Object Model to demonstrate code re-usability and maintainability.

## Development branches:
`documentation` : Any major updates needed to documentation (including this one), will be implemented here, which will then be merged to `master` and then to all downstream feature branches.

`styling` : A development branch used to stage all the new UI changes that will be be merged to `master` and then to all downstream feature branches for further testing on their respective frameworks.

# Usage
Build new or run the existing test scenarios within the automated test framework, using either the BDD tools (e.g. Cucumber) or by implementing a test directly within the code.

# TravisCI
Some of the branches will automatically deploy their tests the hosted continuous integration service to gain feedback on the success of the tests in a hosted environment. 