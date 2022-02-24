import 'dart:collection';
import 'dart:io';
import 'page.dart';
import 'session.dart';
import 'simple_output.dart';

class App {
  Page _page;

  App(Page this._page) {
  }

  start(int port) async {
    HttpServer server = await HttpServer.bind(InternetAddress.anyIPv6, port);
    print('Listening on localhost:${server.port}');

    await for (HttpRequest request in server) {

      new Session(this._page)
        .page(request)
        .output(new SimpleOutput(new HashMap<String, String>()))
        .write(request.response);

      await request.response.close();
    }
  }
}