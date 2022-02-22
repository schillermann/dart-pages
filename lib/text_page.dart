import 'output.dart';
import 'page.dart';

class TextPage implements Page {
  String _body = '';

  TextPage(String this._body) {
  }

  @override
  Page metadata(String key, String value) {
      return this;
  }

  @override
  output(Output output) {
    return output
      .metadata("Content-Type", "text/plain")
      .metadata("Content-Length", this._body.length.toString())
      .metadata("Dart-Pages-Body", this._body);
  }
}