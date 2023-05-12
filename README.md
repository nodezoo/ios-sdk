# NodeZooSDK

An iOS SDK for nodezoo to search the public packaged from [https://nodezoo.com/](https://nodezoo.com/)

## NodeZooService Initializer with API Key

```swift
import NodeZooService

let nodeZooService = NodeZooService(apiKey: "<API Key of >")
```

This initializer creates a 'NodeZooService` instance.

### Parameters

- `apiKey`: API Key to search packages from [nodezoo.com](nodezoo.com)

### Usage

Search the public package as follows:
```swift
let dataTask = nodeZooService.search("express") { result in
    switch result {
    case .success(let packages):
        // packages is the array of the found packages
    case .failure(let error):
        // handle the error here.
}
```
The *dataTask* can be used to cancel the search.

