import 'dart:collection';

import 'output.dart';
import 'page.dart';
import 'text_page.dart';

class VerbosePage implements Page {

  HashMap<String, String> _args = new HashMap<String, String>();

  VerbosePage() {
  }

  @override
  Page metadata(String key, String value) {
    this._args[key] = value;
    return this;
  }

  @override
  output(Output output) {
    return TextPage(this._args.toString()).output(output);
  }
  
}