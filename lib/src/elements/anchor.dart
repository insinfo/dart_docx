import 'package:xml/xml.dart';

import 'element_base.dart';
import 'namespaces.dart';

//   <wp:anchor behindDoc="0" distT="0" distB="0" distL="0" distR="0" simplePos="0" locked="0" layoutInCell="0" allowOverlap="1" relativeHeight="2">
//       <wp:simplePos x="0" y="0" />
//       <wp:positionH relativeFrom="column">
//           <wp:posOffset>5308600</wp:posOffset>
//       </wp:positionH>
//       <wp:positionV relativeFrom="paragraph">
//           <wp:posOffset>99060</wp:posOffset>
//       </wp:positionV>
//       <wp:extent cx="761365" cy="820420" />
//       <wp:effectExtent l="0" t="0" r="0" b="0" />
//       <wp:wrapSquare wrapText="largest" />
//       <wp:docPr id="1" name="Figura1" descr="" title=""></wp:docPr>
//       <wp:cNvGraphicFramePr>
//           <a:graphicFrameLocks
//               xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
//               noChangeAspect="1" />
//       </wp:cNvGraphicFramePr>
//       <a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
//           <a:graphicData
//               uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
//               <pic:pic
//                   xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">
//                   <pic:nvPicPr>
//                       <pic:cNvPr id="1" name="Figura1" descr="" title=""></pic:cNvPr>
//                       <pic:cNvPicPr>
//                           <a:picLocks noChangeAspect="1" noChangeArrowheads="1" />
//                       </pic:cNvPicPr>
//                   </pic:nvPicPr>
//                   <pic:blipFill>
//                       <a:blip r:embed="rId2"></a:blip>
//                       <a:stretch>
//                           <a:fillRect />
//                       </a:stretch>
//                   </pic:blipFill>
//                   <pic:spPr bwMode="auto">
//                       <a:xfrm>
//                           <a:off x="0" y="0" />
//                           <a:ext cx="761365" cy="820420" />
//                       </a:xfrm>
//                       <a:prstGeom prst="rect">
//                           <a:avLst />
//                       </a:prstGeom>
//                   </pic:spPr>
//               </pic:pic>
//           </a:graphicData>
//       </a:graphic>
//   </wp:anchor>
class Anchor implements ElementBase {
  @override
  String get namespace => wordprocessingDrawing2006;

  @override
  Map<String, String> get namespaces => {wordprocessingDrawing2006: 'wp'};

  @override
  String get tagName => 'anchor';

  final String behindDoc;
  final String distT;
  final String distB;
  final String distL;
  final String distR;
  final String simplePos;
  final String locked;
  final String layoutInCell;
  final String allowOverlap;
  final String relativeHeight;

  /// relation ID
  final String embed;

  @override
  Map<String, String> get attributes => {
        'behindDoc': '$behindDoc',
        'distT': '$distT',
        'distB': '$distB',
        'distL': '$distL',
        'distR': '$distR',
        'simplePos': '$simplePos',
        'locked': '$locked',
        'layoutInCell': '$layoutInCell',
        'allowOverlap': '$allowOverlap',
        'relativeHeight': '$relativeHeight',
      };

  const Anchor({
    this.behindDoc = '0',
    this.distT = '0',
    this.distB = '0',
    this.distL = '0',
    this.distR = '0',
    this.simplePos = '0',
    this.locked = '0',
    this.layoutInCell = '0',
    this.allowOverlap = '1',
    this.relativeHeight = '2',
    this.embed = 'rId2',
  });

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName,
        namespace: namespace,
        namespaces: namespaces,
        attributes: attributes, nest: () {
      builder.element('simplePos',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'x': '0', 'y': '0'});

      builder.element('positionH',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'relativeFrom': 'column'}, nest: () {
        builder.element('posOffset',
            namespace: namespace, namespaces: namespaces, nest: () {
          builder.text('5308600');
        });
      });

      builder.element('positionV',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'relativeFrom': 'paragraph'}, nest: () {
        builder.element('posOffset',
            namespace: namespace, namespaces: namespaces, nest: () {
          builder.text('99060');
        });
      });

      builder.element('extent',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'cx': '761365', 'cy': '820420'});

      builder.element('effectExtent',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'l': '0', 't': '0', 'r': '0', 'b': '0'});

      builder.element('wrapSquare',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'wrapText': 'largest'});

      builder.element('docPr',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'id': '1', 'name': 'Figura1', 'descr': '', 'title': ''});

      builder.element('cNvGraphicFramePr',
          namespace: namespace, namespaces: namespaces, nest: () {
        builder.element('graphicFrameLocks',
            namespace: drawingml2006main,
            namespaces: {drawingml2006main: 'a'},
            attributes: {'noChangeAspect': '1'}, nest: () {
          builder.text('99060');
        });
      });

      // a:graphic
      builder.element('graphic',
          namespace: drawingml2006main,
          namespaces: {drawingml2006main: 'a'}, nest: () {
        // <a:graphicData
        builder.element('graphicData',
            namespace: drawingml2006main,
            namespaces: {drawingml2006main: 'a'},
            attributes: {'uri': drawingml2006picture}, nest: () {
          // <pic:pic
          builder.element('pic',
              namespace: drawingml2006picture,
              namespaces: {drawingml2006picture: 'pic'}, nest: () {
            // <pic:nvPicPr>
            builder.element('nvPicPr',
                namespace: drawingml2006picture,
                namespaces: {drawingml2006picture: 'pic'}, nest: () {
              // <pic:cNvPr>
              builder.element('cNvPr',
                  namespace: drawingml2006picture,
                  namespaces: {
                    drawingml2006picture: 'pic'
                  },
                  attributes: {
                    'id': '1',
                    'name': 'Figura1',
                    'descr': '',
                    'title': ''
                  });
              //  <pic:cNvPicPr>
              builder.element('cNvPicPr',
                  namespace: drawingml2006picture,
                  namespaces: {drawingml2006picture: 'pic'}, nest: () {
                //  <a:picLocks
                builder.element('picLocks',
                    namespace: drawingml2006main,
                    namespaces: {
                      drawingml2006main: 'a'
                    },
                    attributes: {
                      'noChangeAspect': '1',
                      'noChangeArrowheads': '1'
                    });
              });
            });

            // <pic:blipFill>
            builder.element('blipFill',
                namespace: drawingml2006picture,
                namespaces: {drawingml2006picture: 'pic'}, nest: () {
              // <a:blip
              builder.element('blip',
                  namespace: drawingml2006main,
                  namespaces: {drawingml2006main: 'a'},
                  attributes: {'embed': embed});
              // <a:stretch>
              builder.element('stretch',
                  namespace: drawingml2006main,
                  namespaces: {drawingml2006main: 'a'}, nest: () {
                // <a:fillRect />
                builder.element('fillRect',
                    namespace: drawingml2006main,
                    namespaces: {drawingml2006main: 'a'});
              });
            });

            // <pic:spPr bwMode="auto">
            builder.element('spPr',
                namespace: drawingml2006picture,
                namespaces: {drawingml2006picture: 'pic'},
                attributes: {'bwMode': 'auto'}, nest: () {
              // <a:xfrm>
              builder.element('xfrm',
                  namespace: drawingml2006main,
                  namespaces: {drawingml2006main: 'a'}, nest: () {
                // <a:off x="0" y="0" />
                builder.element('off',
                    namespace: drawingml2006main,
                    namespaces: {drawingml2006main: 'a'},
                    attributes: {'x': '0', 'y': '0'});
                //<a:ext cx="761365" cy="820420" />
                builder.element('ext',
                    namespace: drawingml2006main,
                    namespaces: {drawingml2006main: 'a'},
                    attributes: {'cx': '761365', 'cy': '820420'});
              });
              // <a:prstGeom prst="rect">
              builder.element('prstGeom',
                  namespace: drawingml2006main,
                  namespaces: {drawingml2006main: 'a'},
                  attributes: {'prst': 'rect'}, nest: () {
                // <a:avLst />
                builder.element('avLst',
                    namespace: drawingml2006main,
                    namespaces: {drawingml2006main: 'a'});
              });
            });
          });
        });
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
