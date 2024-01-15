import 'package:dart_docx/dart_docx.dart';
import 'package:xml/xml.dart';

import 'namespaces.dart';

class Body implements ElementBase {
  Body({required this.children});

  List<ElementBase> children = [];

  void append(ElementBase node) {
    children.add(node);
  }

  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'body';

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName, namespace: namespace, namespaces: namespaces,
        nest: () {
      children.forEach((i) {
        i.buildElement(builder);
      });
    });
  }

  @override
  String toStringXml() {
    final builder = XmlBuilder();
    buildElement(builder);
    final relationshipsXml = builder.buildDocument();
    final result = relationshipsXml.toXmlString(pretty: true);
    //print('Body@toStringXml result: $result');
    return result;
  }

  @override
  Map<String, String> get attributes => <String, String>{};
}
