# My personal notes for each project #

## 003. Build a Local Json App ##

To deserialize Json:

```
import 'dart:convert';

myData = jsonDecode(snapshot.data.toString());
```

To read data from assets use [`FutureBuilder`](https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html) and [`DefaultAssetBundle`](https://api.flutter.dev/flutter/widgets/DefaultAssetBundle-class.html):

```
FutureBuilder(
  future: DefaultAssetBundle
    .of(context)
    .loadString('load_json/person.json'),
    // add path of file to pubspec.yaml
  builder: (context, snapshot) {
    // snapshot.data contains the data as text, which will have to be decoded.
    myData = jsonDecode(snapshot.data.toString());
  }
```
## 004. Build An App To Fetch Data Online Using HTTP GET ## 

Extension: [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) allows writing HTTP requests from VSCode.

`initState()` cannot be async in Flutter:

```
@override
// void initState() async would *not* build
void initState() {
  super.initState();

  // this is async, but it can't be used with await:
  this.getJsonData();  
}
```
If `getJsonData()` returned the data, it'd not be possible to assign it directly, as `var myData = this.getJsonData();`. That is because `await` cannot be used in this call, and as such `initState()` will exit before Future from data fetching has completed.

Alternative is to implement a side-effect in `getJsonData()`. In general, it's not good practice to call `setState()` inside `initState()` because both build widget tree and that could lead to race condition. I kept as in the tutorial, even though it's likely not good.

```
Future<String> getJsonData() async {
  var response = await http.get(
      // Encode the URL
      Uri.encodeFull(url),
      headers: {"Accept": "application/json"});

  setState(() {
    Map<String, dynamic> convertDataToJson = jsonDecode(response.body);
    data = convertDataToJson['entries'];
  });

  return "Success";
}
```

Use `ListView.builder()` to declaratively build content in main UI:

```
return ListView.builder(
  itemCount: data == null ? 0 : data.length,
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
      title: Text(data[index]),
    ),
  },
);
```

## 005. Build Cryptocurrency App From Scratch ## 

Writing HTTP request with query params:

```
Future<String> getCurrencies() async {
  String cryptoUrl = 'pro-api.coinmarketcap.com';
  String endpoint = '/v1/cryptocurrency/listings/latest';
  var queryParams = {'start': '1', 'limit': '50', 'convert': 'USD'};
  
  var uri = Uri.https(cryptoUrl, endpoint, queryParams);
  
  var response = await http.get(
    uri,
    headers: {
      'Accept': 'application/json',
      'X-CMC_PRO_API_KEY': '<fill this in>',
    },
  );

  var data = jsonDecode(response.body);
  ...
}
```

Using `trailing` and `leading` arguments of `ListTile` and also `CircleAvatar` widget:

```
return ListTile(
  leading: CircleAvatar(
    backgroundColor: color,
    child: Text(currency['name'][0]),
  ),
  title: Text(
    currency['name'],
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
);
```

## 006. Build Beautiful Material Navigation Drawer App With Routing ##

Using `Drawer` and `UserAccountsDrawerHeader` widgets:

```
Widget _buildDrawer() {
  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.brown,
            child: Text("E"),
          ),
          otherAccountsPictures: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.brown,
              child: Text("O"),
            )
          ],
          accountName: Text("Eric"),
          accountEmail: Text("eric@doe.com"),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        ListTile(
          title: Text("Page One"),
          trailing: Icon(Icons.arrow_upward),
          onTap: () => Navigator.of(context).pushNamed("/pageOne"),
        ),
        ...
      ],
    ),
  );
}
```

## 007. Swipe to dismiss/delete ListView Tutorial ## 

Wrap `ListTile` with `Dismissible` to add dismiss gesture to it.

Use `Scaffold.of(context).showSnackBar(SnackBar())` to show snack bar.

```
return Dismissible(
  child: ListTile(
    title: Text(items[index]),
  ),
  key: Key(items[index]),
  onDismissed: (direction) {
    items.removeAt(index);
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Item dismissed."),
      ),
    );
  },
  // makes background red during dismiss
  background: Container(
    color: Colors.red,
  ),
);

```