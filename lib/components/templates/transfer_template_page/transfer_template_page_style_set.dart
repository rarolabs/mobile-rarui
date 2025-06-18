import 'transfer_template_page_specs.dart';
import 'transfer_template_page_styles.dart';

enum TransferTemplatePageStyleSet {
  standard;

  const TransferTemplatePageStyleSet();

  TransferTemplatePageStyles get specs => switch (this) {
        standard => TransferTemplatePageSpecs.standard,
      };
}
