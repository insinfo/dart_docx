import 'package:xml/xml.dart';

import 'element_base.dart';
import 'namespaces.dart';

//   <w:tblW w:w="5000" w:type="pct" />
class TableW implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'tblW';
  final int w;
  final String type;

  @override
  Map<String, String> get attributes => {'w:w': '$w', 'w:type': '$type'};

  const TableW({this.w = 5000, this.type = 'pct'});

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
