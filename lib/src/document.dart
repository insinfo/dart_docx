import 'dart:convert';

import 'package:xml/xml.dart' as xml;

// <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
// <w:document xmlns:o="urn:schemas-microsoft-com:office:office"
//     xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
//     xmlns:v="urn:schemas-microsoft-com:vml"
//     xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
//     xmlns:w10="urn:schemas-microsoft-com:office:word"
//     xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
//     xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
//     xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
//     xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
//     xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
//     xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
//     xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml" mc:Ignorable="w14 wp14 w15">
//     <w:body>
//         <w:p>
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
//         <w:sectPr>
//             <w:type w:val="nextPage" />
//             <w:pgSz w:w="11906" w:h="16838" />
//             <w:pgMar w:left="1134" w:right="1134" w:gutter="0" w:header="0" w:top="1134"
//                 w:footer="0" w:bottom="1134" />
//             <w:pgNumType w:fmt="decimal" />
//             <w:formProt w:val="false" />
//             <w:textDirection w:val="lrTb" />
//         </w:sectPr>
//     </w:body>
// </w:document>
import 'package:dart_docx/dart_docx.dart';
import 'package:xml/src/xml/builder.dart';

import 'elements/namespaces.dart';

class Document implements DocxBase {
  @override
  String get tagName => 'document';

  late XmlBuilder _xmlBuilder;
  bool optimizeNamespaces = true;

  Document({required this.children}) {
    _xmlBuilder = xml.XmlBuilder(optimizeNamespaces: optimizeNamespaces);
  }

  List<ElementBase> children = [];

  void append(ElementBase node) {
    children.add(node);
  }

  void addBody(Body body){
    children.add(body);
  }

  Body? get body => children.whereType<Body>().first;

  /// namespaces
  final namespaces = <String, String>{
    office: 'o',
    docRelationships: 'r',
    vml: 'v',
    wordprocessingml: 'w',
    word: 'w10',
    wordprocessingDrawing2006: 'wp',
    wordprocessingShape: 'wps',
    wordprocessingGroup: 'wpg',
    markupCompatibility2006: 'mc',
    wordprocessingDrawing2010: 'wp14',
    wordml2010: 'w14',
    wordml2012: 'w15',
  };

  String get namespace => wordprocessingml;

  @override
  String toStringXml() {
    _xmlBuilder.processing(
        'xml', 'version="1.0" encoding="UTF-8" standalone="yes"');
    var attributes = <String, String>{};

    for (var ns in namespaces.entries) {
      attributes['xmlns:' + ns.value] = ns.key;
    }
    if (optimizeNamespaces == false) {
      attributes['mc:Ignorable'] = 'w14 wp14 w15';
    }

    _xmlBuilder.element(tagName,
        namespace: namespace,
        namespaces: namespaces,
        attributes: attributes, nest: () {
      children.forEach((i) {
        i.buildElement(_xmlBuilder);
      });
    });

    final doc = _xmlBuilder.buildDocument();

    final result = doc.toXmlString(pretty: true);
    print('Document@toStringXml result: $result');
    return result;
  }

  @override
  void buildElement(XmlBuilder builder) {
    throw UnimplementedError();
  }

  List<int> toBytes() {
    return utf8.encode(toStringXml());
  }
}
