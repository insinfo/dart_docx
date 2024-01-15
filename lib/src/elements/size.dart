import 'package:xml/xml.dart';

import 'element_base.dart';
import 'namespaces.dart';

// <w:sz w:val="24" />
// <w:szCs w:val="24" />
class Size implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'sz';
  int val;

  @override
  Map<String, String> get attributes => {'w:val': '$val'};

  Size({this.val = 2});

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
