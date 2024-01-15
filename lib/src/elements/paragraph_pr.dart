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

///<w:pPr>
class ParagraphPr implements ElementBase {
  const ParagraphPr({this.align = 'start', this.styleId = 'Normal'});

  /// center | start | end | both
  final String align;

  /// Normal | Ttulo1
  final String styleId;

  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'pPr';

  @override
  Map<String, String> get attributes => {};

  @override
  void buildElement(XmlBuilder builder) {
    final namespaces = <String, String>{wordprocessingml: 'w'};
    builder.element(tagName,
        namespace: namespace,
        namespaces: namespaces,
        attributes: attributes, nest: () {
      //<w:pStyle w:val="Ttulo1" />
      //    
      builder.element('pStyle',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'w:val': styleId});
      builder.element('bidi',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'w:val': '0'});
      builder.element('jc',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'w:val': align});
      builder.element('rPr', namespace: namespace, namespaces: namespaces,
          nest: () {
        builder.text(' ');
      });
    });
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
