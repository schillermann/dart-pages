import 'dart:io';
import 'page.dart';

class Session {

    Page _page;

    Session(Page this._page) {
    }

    Page page(HttpRequest request) {

        Page target = this._page;
        request.headers.forEach(
          (name, value) {
            target.metadata(name, value.join(','));
        });

        target.metadata('DartPages-Query', request.uri.path);

        return target;
    }

}