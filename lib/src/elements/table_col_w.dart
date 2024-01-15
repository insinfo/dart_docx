import 'package:xml/xml.dart';

import 'element_base.dart';
import 'namespaces.dart';

// <w:tcW w:w="4819" w:type="dxa" />
class TableColW implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'tcW';
  final int w;
  final String type;
  @override
  Map<String, String> get attributes => {'w:w': '$w', 'w:type': '$type'};

  const TableColW({this.w = 4819, this.type = 'dxa'});

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
