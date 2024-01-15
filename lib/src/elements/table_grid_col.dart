import 'package:xml/xml.dart';

import 'element_base.dart';
import 'namespaces.dart';

//  <w:tblGrid>
            //     <w:gridCol w:w="4819" />
            //     <w:gridCol w:w="4819" />
            // </w:tblGrid>
class TableGridCol implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'gridCol';
  final int w;

  @override
  Map<String, String> get attributes => {};

  const TableGridCol({this.w = 4819});

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
