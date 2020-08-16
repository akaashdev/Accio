# Accio

[![CI Status](https://img.shields.io/travis/akaashdev/Accio.svg?style=flat)](https://travis-ci.org/akaashdev/Accio)
[![Version](https://img.shields.io/cocoapods/v/Accio.svg?style=flat)](https://cocoapods.org/pods/Accio)
[![License](https://img.shields.io/cocoapods/l/Accio.svg?style=flat)](https://cocoapods.org/pods/Accio)
[![Platform](https://img.shields.io/cocoapods/p/Accio.svg?style=flat)](https://cocoapods.org/pods/Accio)
[![codecov](https://codecov.io/gh/akaashdev/Accio/branch/master/graph/badge.svg)](https://codecov.io/gh/akaashdev/Accio)
[![HitCount](http://hits.dwyl.com/akaashdev/Accio.svg)](http://hits.dwyl.com/akaashdev/Accio)

Accio is a Collection of Layout Util methods to help developers build Programmatic UI very fast and easy. It completely follows AutoLayout under the hood. It uses declarative approach to do stuff. The main goal of Accio is to remove huge chunks of redundant constraints methods and have a more readable and simple code.

## Usage

The general code to anchor a subview to fill its superview be like,

```swift
var redView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .red
    return view
}()

view.addSubview(redView)

redView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
redView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
redView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
redView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
```

The same code to do with Accio be like,

```swift
var redView: UIView = create {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.backgroundColor = .red
}

view.addSubview(redView)

redView.fill()
```

Yea, adding layout guides is even simpler,

```swift
redView.fill(following: .safeArea)
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Accio is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Accio'
```

## License

Accio is available under the MIT license. See the LICENSE file for more info.

## Author
Akaash Dev </br>
[hello@akaash.dev](mailto:hello@akaash.dev?Subject=Hello!)


<a href="https://twitter.com/akaash_dev"><img src="https://raw.githubusercontent.com/akaashdev/portfolio-site/master/img/social-icons/twitter-icon-original.png" width=38px height=38px></a> &nbsp; <a href="https://linkedin.com/in/akaashdev"><img src="https://raw.githubusercontent.com/akaashdev/portfolio-site/master/img/social-icons/linkedin-icon-original.png" width=38px height=38px></a> 
