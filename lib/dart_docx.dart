/// Support for doing something awesome.
///
/// More dartdocs go here.
library dart_docx;

// docx file struture
// _rels/
//    .rels
//
// docProps/
//    app.xml
//    core.xml
//
// word/
//      _rels/
//            document.xml.rels
//      theme/
//            theme1.xml
//      document.xml
//      fontTable.xml
//      settings.xml
//      styles.xml
//      webSettings.xml
//
//
// [Content_Types].xml

export 'src/rels/relationships.dart';
export 'src/rels/relationship.dart';
export 'src/docx_base.dart';
export 'src/font_table.dart';
export 'src/styles/styles.dart';
export 'src/settings.dart';
export 'src/document.dart';
export '/src/docx.dart';
export '/src/elements/element_base.dart';
export '/src/elements/sect_type.dart';
export '/src/elements/sect_pr.dart';
export '/src/elements/body.dart';
export 'src/elements/paragraph_pr.dart';
export 'src/elements/paragraph.dart';
export 'src/elements/span.dart';
export 'src/elements/kern.dart';
export 'src/elements/size.dart';
export 'src/elements/r_fonts.dart';
export 'src/elements/spacing.dart';
export 'src/elements/page_margin.dart';
export 'src/elements/page_size.dart';

export 'src/elements/table_cell_margin.dart';
export 'src/elements/table_ind.dart';
export 'src/elements/table_w.dart';
export 'src/elements/table_pr.dart';
export 'src/elements/table_grid_col.dart';
export 'src/elements/table_grid.dart';
export 'src/elements/table_col.dart';
export 'src/elements/table_row.dart';
export 'src/elements/table_border.dart';
export 'src/elements/table_col_borders.dart';
export 'src/elements/table_col_w.dart';
export 'src/elements/table_col_pr.dart';
export 'src/elements/table_pr.dart';
export 'src/elements/table.dart';
export 'src/elements/anchor.dart';
export 'src/elements/drawing.dart';

export 'src/content_types.dart';
export 'src/doc_props/app_properties.dart';
export 'src/doc_props/core_properties.dart';
