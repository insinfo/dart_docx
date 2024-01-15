import 'package:dart_docx/dart_docx.dart';
import 'package:xml/xml.dart' as xml;

///<?xml version="1.0" encoding="UTF-8"?>
///<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
///    <Relationship Id="rId1"
///        Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles"
///        Target="styles.xml" />
///</Relationships>
class Relationship implements DocxBase {
  @override
  String get tagName => 'Relationship';

  String id = '';
  String type = '';
  String target = '';

  Relationship({required this.id, required this.type, required this.target});

  @override
  String toStringXml() {
    final builder = xml.XmlBuilder();
    builder.processing(
        'xml', 'version="1.0" encoding="UTF-8" standalone="yes"');
    builder.element(tagName,
        attributes: {'Id': id, 'Type': type, 'Target': target});
    final relationshipXml = builder.buildDocument();
    final result = relationshipXml.toXmlString(pretty: true);
    // print(result);
    return result;
  }

  @override
  void buildElement(xml.XmlBuilder builder) {
    builder.element(tagName, attributes: toMap());
  }

  Relationship.fromMap(Map<String, dynamic> map) {
    id = map['Id'];
    type = map['Type'];
    target = map['Target'];
  }

  Map<String, String> toMap() {
    var map = <String, String>{};
    map['Id'] = id;
    map['Type'] = type;
    map['Target'] = target;
    return map;
  }
}
