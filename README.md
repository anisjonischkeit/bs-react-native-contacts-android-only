🚨🚨THIS IS EXPERIMENTAL.🚨🚨
🚨🚨NOT ALL FEATURES WORK ON IOS.🚨🚨
IF YOU PLAN TO USE IOS AS A TARGET, USE [THIS](https://github.com/anisjonischkeit/bs-react-native-contacts).

The types are based on the index.d.ts spec found in the react-native-contacts project however I haven't tested the full surface area of this library so if you find any problems let me know.

# bs-react-native-contacts

[react-native-contacts](http://npm.im/react-native-contacts) bindings for [BuckleScript](https://bucklescript.github.io) in [Reason](https://reasonml.github.io).

# Installation

```
yarn add bs-react-native-contacts
```

# Usage

Usage is the same as that of the [react-native-contacts](http://npm.im/react-native-contacts) library with a slight difference. Where the original library has callbacks that look like:

```javascript
Contacts.getAll((err, contacts) => {
  if (err) {
    throw err;
  }
  // you can now use contacts
});
```

these bindings wrap the result in a result type:

```reasonml
open Belt.Result;

Contacts.getAll(result => switch(result) {
  | Ok(contacts) => // you can use contacts here
  | Error(msg) => // you can see the error message here
})
```

## Basic Usage

see [test/Example.re](test/Example.re)
