import 'dart:convert';

import 'package:dart_docx/dart_docx.dart';
import 'package:dart_docx/src/elements/namespaces.dart';
import 'package:xml/src/xml/builder.dart';

class FontTable implements DocxBase {
  @override
  void buildElement(XmlBuilder builder) {}

  Map<String, String> namespaces = {wordprocessingml: 'w', docRelationships: 'r'};

  String get namespace => wordprocessingml;

  @override
  String get tagName => 'fonts';



  @override
  String toStringXml() {
    return '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:fonts xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">
    <w:font w:name="Times New Roman">
        <w:charset w:val="00" w:characterSet="windows-1252" />
        <w:family w:val="roman" />
        <w:pitch w:val="variable" />
    </w:font>
    <w:font w:name="Symbol">
        <w:charset w:val="02" />
        <w:family w:val="roman" />
        <w:pitch w:val="variable" />
    </w:font>
    <w:font w:name="Arial">
        <w:charset w:val="00" w:characterSet="windows-1252" />
        <w:family w:val="swiss" />
        <w:pitch w:val="variable" />
    </w:font>
    <w:font w:name="Liberation Serif">
        <w:altName w:val="Times New Roman" />
        <w:charset w:val="00" w:characterSet="windows-1252" />
        <w:family w:val="roman" />
        <w:pitch w:val="variable" />
    </w:font>
    <w:font w:name="Liberation Sans">
        <w:altName w:val="Arial" />
        <w:charset w:val="00" w:characterSet="windows-1252" />
        <w:family w:val="swiss" />
        <w:pitch w:val="variable" />
    </w:font>
</w:fonts>''';
  }

  List<int> toBytes() {
    return utf8.encode(toStringXml());
  }
}
