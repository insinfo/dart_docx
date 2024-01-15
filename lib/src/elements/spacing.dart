import 'package:xml/xml.dart';

import 'element_base.dart';
import 'namespaces.dart';

//   <w:spacing w:before="240" w:after="120" />
class Spacing implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'spacing';
  int before;
  int after;

  @override
  Map<String, String> get attributes => {
        'w:before': '$before',
        'w:after': '$after',
      };

  Spacing({this.before = 0, this.after = 0});

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
