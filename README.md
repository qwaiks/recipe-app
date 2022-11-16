# Chefio Mobile App

A recipe mobile app

<p align="center">

[![ForTheBadge made-with-flutter](https://img.shields.io/badge/flutter-made%20with%20flutter-blue.svg)](https://flutter.dev)
[![ForTheBadge ios-supported](https://img.shields.io/badge/IOS-IOS%20Supported-lightgrey.svg)](https://flutter.dev)
[![ForTheBadge ios-android](https://img.shields.io/badge/android-android%20supported-green.svg)](https://flutter.dev)
[![ForTheBadge built-with-love](http://ForTheBadge.com/images/badges/built-with-love.svg)](https://github.com/qwaiks/recipe-app)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/qwaiks/recipe-app/graphs/commit-activity)

</p>

This is a mobile App implementation from a UI shared on [lapa.ninja](https://www.lapa.ninja/freebies/chefio-recipe-free-app-ui-kit-for-figma/)

You can find the link to the figma file [here](https://www.figma.com/file/35vdsNHEIuaa5O6lu50Ztx/Chefio---Recipe-App-UI-Kit?node-id=156%3A0&t=TzvRuPJNoF1tz5ND-1)

Api and Backend yet to be implemented.

## App Architecture

The app is composed by two main layers.

### Data Layer

The data layer will contain repositories used to fetch data from an Api.

The data is then parsed (using Freezed) and returned using **type-safe** entity classes.



### Presentation Layer

This layer holds all the widgets, along with their controllers.

Widgets do not communicate directly with the repository.

Instead, they watch some controllers that extend the `StateNotifier` class


### [LICENSE: MIT](LICENSE.md)