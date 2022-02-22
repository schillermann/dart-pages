
import 'dart:collection';
import 'dart:io';
import 'output.dart';

class SimpleOutput implements Output {

  HashMap<String, String> _before;

  SimpleOutput(HashMap<String, String> this._before);

  @override
  Output metadata(String name, String value) {
    HashMap<String, String> after = this._before;

    after[name] = value;

    return new SimpleOutput(after);
  }

  @override
  void writeTo(HttpResponse output) {
    String body = '';

    for (String k in this._before.keys) {
      if(k == 'DartPages-Body') {
        body = this._before[k].toString();
        continue;
      }
      output.headers.add(k, this._before[k].toString());
    }
    
    output.write(body);
  }
}