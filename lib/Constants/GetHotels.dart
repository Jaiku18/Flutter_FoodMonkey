import 'package:http/http.dart' as http;
import 'dart:convert';

getHotels() async {
  String url =
      'https://developers.zomato.com/api/v2.1/search?lat=13.1336&lon=80.2565';

  http.Response response = await http.get(Uri.encodeFull(url), headers: {
    "Accept": "application/json",
    "user-key": "d97b3ec78dc51c83b587313f10fbfac8"
  });
  String data = response.body;
  String names;

  List<String> name = new List<String>();
  int i = 0;
  for (int i = 0; i < 10; i++) {
    names = jsonDecode(data)["restaurants"][i]["restaurant"]["name"];
    name.add(names);
  }

  name.forEach((element) => print(element));
}
