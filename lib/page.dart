import 'dart:io';

import 'output.dart';

abstract class Page {
    Page metadata(String key, String value);
    output(Output output);
}