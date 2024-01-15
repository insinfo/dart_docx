// <w:type w:val="nextPage" />
import 'package:dart_docx/dart_docx.dart';
import 'package:xml/src/xml/builder.dart';

import 'namespaces.dart';

//  <w:pgSz w:w="11906" w:h="16838" />
class PageSize implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'pgSz';
  final int width;
  final int height;

  @override
  Map<String, String> get attributes => {'w:w': '$width', 'w:h': '$height'};

  const PageSize({this.width = 11906, this.height = 11906});

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName,
        namespace: namespace, namespaces: namespaces, attributes: attributes);
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
