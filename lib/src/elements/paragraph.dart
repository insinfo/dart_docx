import 'package:dart_docx/dart_docx.dart';
import 'package:xml/src/xml/builder.dart';

import 'namespaces.dart';

//        <w:p>
//             <w:pPr>
//                 <w:pStyle w:val="Normal" />
//                 <w:bidi w:val="0" />
//                 <w:jc w:val="start" />
//                 <w:rPr></w:rPr>
//             </w:pPr>
//             <w:r>
//                 <w:rPr></w:rPr>
//                 <w:t>Teste helo</w:t>
//             </w:r>
//         </w:p>
class Paragraph implements ElementBase {
  const Paragraph(
      {required this.children, this.props = const ParagraphPr()});

  final ParagraphPr props;

  final List<ElementBase> children;

  void append(ElementBase node) {
    children.add(node);
  }

  @override
  String get tagName => 'p';

  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  void buildElement(XmlBuilder builder) {
    children.add(props);
    builder.element(tagName,
        namespace: namespace,
        namespaces: {wordprocessingml: 'w'},
        attributes: attributes, nest: () {
      children.forEach((i) {
        i.buildElement(builder);
      });
    });
  }

  @override
  Map<String, String> get attributes => {};

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
