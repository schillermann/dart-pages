import 'dart:io';
import 'output.dart';
import 'page.dart';

class SimplePage implements Page {

    String _body = '';

    SimplePage(String this._body) {
    }

    @override
    Page metadata(String key, String value) {
        return this;
    }

    @override
    output(Output output) {
      return output
        .metadata("Content-Length", this._body.length.toString())
        .metadata("Dart-Pages-Body", this._body);
    }
}