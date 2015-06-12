## Module Data.DOM.Simple.Ajax

#### `ReadyState`

``` purescript
data ReadyState
  = Unsent
  | Opened
  | HeadersReceived
  | Loading
  | Done
```

#### `Url`

``` purescript
type Url = String
```

#### `HttpMethod`

``` purescript
data HttpMethod
  = GET
  | POST
  | PUT
  | DELETE
  | PATCH
  | HEAD
  | OPTIONS
  | JSONP
  | HttpMethod String
```

##### Instances
``` purescript
instance showHttpMethod :: Show HttpMethod
```

#### `ResponseType`

``` purescript
data ResponseType
  = Default
  | ArrayBuffer
  | Blob
  | Document
  | Json
  | Text
  | MozBlob
  | MozChunkedText
  | MozChunkedArrayBuffer
```

##### Instances
``` purescript
instance showResponseType :: Show ResponseType
```

#### `ArrayBuffer`

``` purescript
data ArrayBuffer :: *
```

#### `ArrayBufferView`

``` purescript
data ArrayBufferView :: *
```

#### `Blob`

``` purescript
data Blob :: *
```

#### `FormData`

``` purescript
data FormData :: *
```

#### `HttpData`

``` purescript
data HttpData a
  = NoData
  | TextData String
  | ArrayBufferData ArrayBuffer
  | ArrayBufferViewData ArrayBufferView
  | BlobData Blob
  | FormData FormData
  | DocumentData HTMLDocument
  | JsonData a
```

#### `makeXMLHttpRequest`

``` purescript
makeXMLHttpRequest :: forall eff. Eff (dom :: DOM | eff) XMLHttpRequest
```

#### `readyState`

``` purescript
readyState :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) ReadyState
```

#### `onReadyStateChange`

``` purescript
onReadyStateChange :: forall eff e. Eff e Unit -> XMLHttpRequest -> Eff (dom :: DOM | eff) Unit
```

#### `open`

``` purescript
open :: forall eff. HttpMethod -> Url -> XMLHttpRequest -> Eff (dom :: DOM | eff) Unit
```

#### `send`

``` purescript
send :: forall eff a. HttpData a -> XMLHttpRequest -> Eff (dom :: DOM | eff) Unit
```

#### `setResponseType`

``` purescript
setResponseType :: forall eff. ResponseType -> XMLHttpRequest -> Eff (dom :: DOM | eff) Unit
```

#### `responseType`

``` purescript
responseType :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) ResponseType
```

#### `response`

``` purescript
response :: forall eff a. XMLHttpRequest -> Eff (dom :: DOM | eff) (HttpData a)
```

#### `responseText`

``` purescript
responseText :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) String
```

#### `status`

``` purescript
status :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) Int
```

#### `statusText`

``` purescript
statusText :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) String
```

#### `setRequestHeader`

``` purescript
setRequestHeader :: forall eff. String -> String -> XMLHttpRequest -> Eff (dom :: DOM | eff) Unit
```

#### `getAllResponseHeaders`

``` purescript
getAllResponseHeaders :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) String
```

#### `getResponseHeader`

``` purescript
getResponseHeader :: forall eff. String -> XMLHttpRequest -> Eff (dom :: DOM | eff) (Maybe String)
```

#### `overrideMimeType`

``` purescript
overrideMimeType :: forall eff. String -> XMLHttpRequest -> Eff (dom :: DOM | eff) Unit
```


