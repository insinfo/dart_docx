import 'dart:convert';

import 'package:dart_docx/dart_docx.dart';
import 'package:xml/src/xml/builder.dart';

import '../elements/namespaces.dart';

class Style implements DocxBase {
  String get namespace => wordprocessingml;

  @override
  String get tagName => 'style';

  @override
  void buildElement(XmlBuilder builder) {}

  @override
  String toStringXml() {
    return '';
  }
}
