import 'package:dart_docx/dart_docx.dart';
import 'package:xml/xml.dart';

import 'element_base.dart';
import 'namespaces.dart';

// <w:drawing>

// </w:drawing>

class Drawing implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'drawing';

  @override
  Map<String, String> get attributes => {};

  final Anchor anchor;

  Drawing({required this.anchor});

  factory Drawing.fromPngImage(List<int> bytes) {
    var drawing = Drawing(anchor: Anchor());

    return drawing;
  }

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName,
        namespace: namespace,
        namespaces: namespaces,
        attributes: attributes,
        nest: () {});
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
}
