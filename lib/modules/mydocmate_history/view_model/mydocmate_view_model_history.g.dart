// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mydocmate_view_model_history.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MydocmateViewModelHistory on _MydocmateViewModelHistory, Store {
  late final _$dateSelectAtom =
      Atom(name: '_MydocmateViewModelHistory.dateSelect', context: context);

  @override
  int get dateSelect {
    _$dateSelectAtom.reportRead();
    return super.dateSelect;
  }

  @override
  set dateSelect(int value) {
    _$dateSelectAtom.reportWrite(value, super.dateSelect, () {
      super.dateSelect = value;
    });
  }

  late final _$getDayFormatAtom =
      Atom(name: '_MydocmateViewModelHistory.getDayFormat', context: context);

  @override
  String get getDayFormat {
    _$getDayFormatAtom.reportRead();
    return super.getDayFormat;
  }

  @override
  set getDayFormat(String value) {
    _$getDayFormatAtom.reportWrite(value, super.getDayFormat, () {
      super.getDayFormat = value;
    });
  }

  late final _$stepSetAtom =
      Atom(name: '_MydocmateViewModelHistory.stepSet', context: context);

  @override
  int get stepSet {
    _$stepSetAtom.reportRead();
    return super.stepSet;
  }

  @override
  set stepSet(int value) {
    _$stepSetAtom.reportWrite(value, super.stepSet, () {
      super.stepSet = value;
    });
  }

  @override
  String toString() {
    return '''
dateSelect: ${dateSelect},
getDayFormat: ${getDayFormat},
stepSet: ${stepSet}
    ''';
  }
}
