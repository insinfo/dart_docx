import 'dart:convert';

import 'package:dart_docx/dart_docx.dart';
import 'package:xml/src/xml/builder.dart';

import '../elements/namespaces.dart';

class Styles implements DocxBase {
  @override
  void buildElement(XmlBuilder builder) {}

  String get namespace => wordprocessingml;

  @override
  String get tagName => 'styles';

  @override
  String toStringXml() {
    return '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:styles xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="w14">
    <w:docDefaults>
        <w:rPrDefault>
            <w:rPr>
                <w:rFonts w:ascii="Liberation Serif" w:hAnsi="Liberation Serif" w:eastAsia="NSimSun"
                    w:cs="Lucida Sans" />
                <w:kern w:val="2" />
                <w:sz w:val="24" />
                <w:szCs w:val="24" />
                <w:lang w:val="pt-BR" w:eastAsia="zh-CN" w:bidi="hi-IN" />
            </w:rPr>
        </w:rPrDefault>
        <w:pPrDefault>
            <w:pPr>
                <w:suppressAutoHyphens w:val="true" />
            </w:pPr>
        </w:pPrDefault>
    </w:docDefaults>
    <w:style w:type="paragraph" w:styleId="Normal">
        <w:name w:val="Normal" />
        <w:qFormat />
        <w:pPr>
            <w:widowControl />
            <w:suppressAutoHyphens w:val="true" />
            <w:bidi w:val="0" />
            <w:spacing w:before="0" w:after="0" />
            <w:jc w:val="start" />
        </w:pPr>
        <w:rPr>
            <w:rFonts w:ascii="Liberation Serif" w:hAnsi="Liberation Serif" w:eastAsia="NSimSun"
                w:cs="Lucida Sans" />
            <w:color w:val="auto" />
            <w:kern w:val="2" />
            <w:sz w:val="24" />
            <w:szCs w:val="24" />
            <w:lang w:val="pt-BR" w:eastAsia="zh-CN" w:bidi="hi-IN" />
        </w:rPr>
    </w:style>
    <w:style w:type="paragraph" w:styleId="Ttulo1">
        <w:name w:val="Heading 1" />
        <w:basedOn w:val="Ttulo" />
        <w:next w:val="Corpodotexto" />
        <w:qFormat />
        <w:pPr>
            <w:numPr>
                <w:ilvl w:val="0" />
                <w:numId w:val="1" />
            </w:numPr>
            <w:spacing w:before="240" w:after="120" />
            <w:outlineLvl w:val="0" />
        </w:pPr>
        <w:rPr>
            <w:b />
            <w:bCs />
            <w:sz w:val="36" />
            <w:szCs w:val="36" />
        </w:rPr>
    </w:style>
    <w:style w:type="paragraph" w:styleId="Ttulo">
        <w:name w:val="Título" />
        <w:basedOn w:val="Normal" />
        <w:next w:val="Corpodotexto" />
        <w:qFormat />
        <w:pPr>
            <w:keepNext w:val="true" />
            <w:spacing w:before="240" w:after="120" />
        </w:pPr>
        <w:rPr>
            <w:rFonts w:ascii="Liberation Sans" w:hAnsi="Liberation Sans"
                w:eastAsia="Microsoft YaHei" w:cs="Lucida Sans" />
            <w:sz w:val="28" />
            <w:szCs w:val="28" />
        </w:rPr>
    </w:style>
    <w:style w:type="paragraph" w:styleId="Corpodotexto">
        <w:name w:val="Body Text" />
        <w:basedOn w:val="Normal" />
        <w:pPr>
            <w:spacing w:lineRule="auto" w:line="276" w:before="0" w:after="140" />
        </w:pPr>
        <w:rPr></w:rPr>
    </w:style>
    <w:style w:type="paragraph" w:styleId="Lista">
        <w:name w:val="List" />
        <w:basedOn w:val="Corpodotexto" />
        <w:pPr></w:pPr>
        <w:rPr>
            <w:rFonts w:cs="Lucida Sans" />
        </w:rPr>
    </w:style>
    <w:style w:type="paragraph" w:styleId="Legenda">
        <w:name w:val="Caption" />
        <w:basedOn w:val="Normal" />
        <w:qFormat />
        <w:pPr>
            <w:suppressLineNumbers />
            <w:spacing w:before="120" w:after="120" />
        </w:pPr>
        <w:rPr>
            <w:rFonts w:cs="Lucida Sans" />
            <w:i />
            <w:iCs />
            <w:sz w:val="24" />
            <w:szCs w:val="24" />
        </w:rPr>
    </w:style>
    <w:style w:type="paragraph" w:styleId="Ndice">
        <w:name w:val="Índice" />
        <w:basedOn w:val="Normal" />
        <w:qFormat />
        <w:pPr>
            <w:suppressLineNumbers />
        </w:pPr>
        <w:rPr>
            <w:rFonts w:cs="Lucida Sans" />
        </w:rPr>
    </w:style>
</w:styles>''';
  }

  List<int> toBytes() {
    return utf8.encode(toStringXml());
  }
}
