import 'package:dart_docx/dart_docx.dart';
import 'package:xml/src/xml/builder.dart';

import 'namespaces.dart';

//             <w:r>
//                 <w:rPr></w:rPr>
//                 <w:t>Teste helo</w:t>
//             </w:r>

class Span implements ElementBase {
  @override
  String get tagName => 'r';

  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  final String val;
  final bool bold;

  final bool italic;

  /// 24 = 12pt | 36 = 18pt
  final int fontSize;

  /// <w:color w:val="C9211E" />
  final String? color;

  Span(this.val,
      {this.bold = false, this.italic = false, this.fontSize = 24, this.color});

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName,
        namespace: namespace,
        namespaces: namespaces,
        attributes: attributes, nest: () {
      //
      // <w:r>
      //       <w:rPr>
      //          <w:b />
      //         <w:bCs />
      //     </w:rPr>
      //       <w:t>Teste helo</w:t>
      //</w:r>
      // rPr => Span Properties
      builder.element('rPr', namespace: namespace, namespaces: namespaces,
          nest: () {
        if (bold) {
          builder.element('w:b');
        }

        //<w:i />
        if (italic) {
          builder.element('w:i');
        }
        //<w:sz w:val="36" />=18pt
        //  <w:sz w:val="24" />=12pt
        //  <w:szCs w:val="24" />
        builder.element('w:sz', attributes: {'w:val': fontSize.toString()});

        if (color != null) {
          builder.element('w:color', attributes: {'w:val': color!});
        }
        builder.text(' ');
      });
      builder.element('t',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'xml:space': 'preserve'}, nest: () {
        builder.text(val);
      });
    });
  }

  @override
  String toStringXml() {
    final builder = XmlBuilder();
    buildElement(builder);
    final relationshipXml = builder.buildDocument();
    final result = relationshipXml.toXmlString(pretty: true);
    return result;
  }

  @override
  Map<String, String> get attributes => {};
}
