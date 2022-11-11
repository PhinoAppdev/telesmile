import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  static Future getCategoryModel() async {
    var url = "http://telesmile.co.in/app_apis/category.php";
    Map formdata = {'API_KEY': "sXZ7tdYP7hy2qZKD9cL"};

    http.Response response = await http.post(Uri.parse(url), body: formdata);
    var jsonData = json.decode(response.body);
    return jsonData; // var response = await http
    //     .get(Uri.parse('http://telesmile.co.in/app_apis/category.php'));
    // var jsonData = json.decode(response.body);
    // return jsonData;
  }

  static Future getGalleryModel() async {
    Map formdata = {'API_KEY': "sXZ7tdYP7hy2qZKD9cL"};
    http.Response response = await http.post(
        Uri.parse("http://telesmile.co.in/app_apis/gallery.php"),
        body: formdata);
    var jsonData = json.decode(response.body);
    return jsonData;
  }
}

Future getTopicsModel({required String id}) async {
  var url = "http://telesmile.co.in/app_apis/topics.php";
  Map formdata = {'API_KEY': "sXZ7tdYP7hy2qZKD9cL", 'cat_id': id};
  http.Response response = await http.post(Uri.parse(url), body: formdata);
  var jsonData = json.decode(response.body);
  return jsonData;
}

Future getTopicDetailsModel({required String id}) async {
  Map formdata = {'API_KEY': "sXZ7tdYP7hy2qZKD9cL", 'topic_id': id};
  var url = "http://telesmile.co.in/app_apis/topic_details.php";
  http.Response response = await http.post(Uri.parse(url), body: formdata);
  var jsonData = json.decode(response.body);
  return jsonData;
}
