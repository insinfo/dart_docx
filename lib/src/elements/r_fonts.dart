import 'package:xml/xml.dart';
import 'element_base.dart';
import 'namespaces.dart';

//<w:rFonts w:ascii="Liberation Serif" w:hAnsi="Liberation Serif" w:eastAsia="NSimSun"  w:cs="Lucida Sans" />
class RFonts implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'rFonts';
  String ascii;
  String hAnsi;
  String eastAsia;
  String cs;

  @override
  Map<String, String> get attributes => {
        'w:ascii': '$ascii',
        'w:hAnsi': '$hAnsi',
        'w:eastAsia': '$eastAsia',
        'w:cs': '$cs',
      };

  RFonts({
    this.ascii = 'Liberation Serif',
    this.hAnsi = 'Liberation Serif',
    this.eastAsia = 'NSimSun',
    this.cs = 'Lucida Sans',
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
