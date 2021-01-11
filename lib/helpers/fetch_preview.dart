import 'package:http/http.dart';
import 'package:html/parser.dart';

class FetchPreview {

  Future fetch(url) async {
    final client = Client();
    final response = await client.get(_validate(url));
    final document = parse(response.body);

    String title, description, image, favIcon;

    //メタデータからOGP情報を取得
    var elements = document.getElementsByTagName('meta');
    elements.forEach((tmp) {
      if (tmp.attributes['property'] == 'og:title') {
        title = tmp.attributes['content'];
      }

      if (tmp.attributes['property'] == 'og:description') {
        description = tmp.attributes['content'];
      }

      if (description == null || description.isEmpty) {
        if (tmp.attributes['name'] == 'description') {
          description = tmp.attributes['content'];
        }
      }

      if (tmp.attributes['property'] == 'og:image') {
        image = tmp.attributes['content'];
      }

    });

    // タグを指定してデータを取得
    if (title == null || title.isEmpty) {
      title = document.getElementsByTagName('title')[0].text;
    }

    var linkElements = document.getElementsByTagName('link');
    linkElements.forEach((tmp) {
      if (tmp.attributes['rel']?.contains('icon') == true) {
        favIcon = tmp.attributes['href'];
      }
    });

    return {
      'title': title ?? '',
      'description': description ?? '',
      'image': image ?? '',
      'favIcon': favIcon ?? ''
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
