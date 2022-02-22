# Pages Framework Object Oriented With Dart

DartPages is an experimental prototype of a web framework, inspired by [Yegor Bugayenko](https://www.yegor256.com/) with the project [jpages](https://github.com/yegor256/jpages).

This is how you start a web app:
```dart
import 'lib/ verbose_page.dart';
import 'lib/app.dart';
import 'lib/output.dart';
import 'lib/page.dart';
import 'lib/simple_page.dart';
import 'lib/text_page.dart';

class PageHelloWorld implements Page {

  @override
  Page metadata(String key, String value) {
    if('Dart-Pages-Query' == key && '/hello' == value) {
      return TextPage("Hello, world!");
    }
    return TextPage("Not found!");
  }

  @override
  output(Output output) {
    return output
      .metadata("Dart-Pages-Body", "Not found");
  }
}

Future<void> main() async {
  App(PageHelloWorld()).start(8000);
}
```