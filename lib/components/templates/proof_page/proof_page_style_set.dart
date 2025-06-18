part of 'proof_page_specs.dart';

enum ProofPageStyleSet {
  standard;

  const ProofPageStyleSet();

  ProofPageStyles get specs {
    return switch (this) {
      standard => ProofPageSpecs.standard,
    };
  }
}
