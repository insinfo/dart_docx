import 'package:dart_docx/dart_docx.dart';
import 'package:xml/src/xml/builder.dart';
import 'namespaces.dart';

//   <w:pgMar w:left="1134" w:right="1134" w:gutter="0" w:header="0" w:top="1134" w:footer="0" w:bottom="1134" />
class PageMargin implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'pgMar';
  final int left;
  final int right;
  final int gutter;
  final int header;
  final int top;
  final int footer;
  final int bottom;

  @override
  Map<String, String> get attributes => {
        'w:left': '$left',
        'w:right': '$right',
        'w:gutter': '$gutter',
        'w:header': '$header',
        'w:top': '$top',
        'w:footer': '$footer',
        'w:bottom': '$bottom'
      };

  const PageMargin({
    this.left = 1134,
    this.right = 1134,
    this.gutter = 0,
    this.header = 0,
    this.top = 1134,
    this.footer = 0,
    this.bottom = 1134,
  });

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
