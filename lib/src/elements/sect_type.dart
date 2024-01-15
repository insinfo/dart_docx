// <w:type w:val="nextPage" />
import 'package:dart_docx/dart_docx.dart';
import 'package:xml/src/xml/builder.dart';

import 'namespaces.dart';

class SectType implements ElementBase {
  @override
  String get tagName => 'type';

  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  final String val;

  const SectType({this.val = 'nextPage'});

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName,namespace:namespace,namespaces:namespaces, attributes: attributes);
  }

  @override
  String toStringXml() {
    final builder = XmlBuilder();
    buildElement(builder);
    final relationshipXml = builder.buildDocument();
    final result = relationshipXml.toXmlString(pretty: true);
    // print(result);
    return result;
  }

  @override
  Map<String, String> get attributes => {'w:val': val};
}
