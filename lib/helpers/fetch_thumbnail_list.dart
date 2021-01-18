import 'package:http/http.dart';
import 'package:html/parser.dart';

class FetchThumbnailList {

  Future fetch(url) async {
    final client = Client();
    final response = await client.get(_validate(url));
    final document = parse(response.body);

    List<String> list = List();
    /*
    final elements = document.getElementsByClassName('thumb');
    list = elements.map((element) => element.getElementsByTagName('img')[0].attributes['src']).toList();
    */

    final elements = document.getElementsByTagName('img');
    list = elements.map((element) => element.attributes['src']).toList();

    return {
      'thumbs': list ?? List(),
    };
  }

  _validate(String url) {
    if (url?.startsWith('http://') == true || url?.startsWith('https://') == true) {
      return url;
    }
    else {
      return 'http://$url';
    }
  }

}
