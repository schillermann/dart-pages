import 'dart:io';

abstract class Output {
    Output metadata(String name, String value);
    void writeTo(HttpResponse output);
}