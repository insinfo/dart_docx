import 'package:xml/xml.dart';

import 'element_base.dart';
import 'namespaces.dart';

//  <w:lang w:val="pt-BR" w:eastAsia="zh-CN" w:bidi="hi-IN" />
class Lang implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'lang';
  String val;
  String eastAsia;
  String bidi;

  @override
  Map<String, String> get attributes => {
        'w:val': '$val',
        'w:eastAsia': '$eastAsia',
        'w:bidi': '$bidi',
      };

  Lang({this.val = 'pt-BR', this.eastAsia = 'zh-CN', this.bidi = 'hi-IN'});

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
