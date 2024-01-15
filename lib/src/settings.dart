// <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
// <w:settings xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
//     <w:zoom w:percent="100" />
//     <w:defaultTabStop w:val="709" />
//     <w:autoHyphenation w:val="true" />
//     <w:compat>
//         <w:compatSetting w:name="compatibilityMode" w:uri="http://schemas.microsoft.com/office/word"
//             w:val="15" />
//     </w:compat>
// </w:settings>

import 'dart:convert';

import 'package:dart_docx/dart_docx.dart';
import 'package:xml/src/xml/builder.dart';

import 'elements/namespaces.dart';

class Settings implements DocxBase {
  @override
  String tagName = 'settings';

  Map<String, String> namespaces = {wordprocessingml: 'w'};

  String get namespace => wordprocessingml;

  @override
  void buildElement(XmlBuilder builder) {
    throw UnimplementedError();
  }

  @override
  String toStringXml() {
    return '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:settings xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
    <w:zoom w:percent="100" />
    <w:defaultTabStop w:val="709" />
    <w:autoHyphenation w:val="true" />
    <w:compat>
        <w:compatSetting w:name="compatibilityMode" w:uri="http://schemas.microsoft.com/office/word"
            w:val="15" />
    </w:compat>
</w:settings>''';
  }

  List<int> toBytes() {
    return utf8.encode(toStringXml());
  }
}

//
class Zoom {
  String tagName = 'w:zoom';
  //w:percent
  String percent = '100';
}

//
class DefaultTabStop {
  String tagName = 'w:defaultTabStop';
  String val = '709';
}

class AutoHyphenation {
  String tagName = 'w:autoHyphenation';
  String val = 'true';
}
