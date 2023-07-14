// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mydocmate_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MydocmateViewModel on _MydocmateViewModel, Store {
  late final _$switchValueAtom =
      Atom(name: '_MydocmateViewModel.switchValue', context: context);

  @override
  bool get switchValue {
    _$switchValueAtom.reportRead();
    return super.switchValue;
  }

  @override
  set switchValue(bool value) {
    _$switchValueAtom.reportWrite(value, super.switchValue, () {
      super.switchValue = value;
    });
  }

  late final _$getDayFormatAtom =
      Atom(name: '_MydocmateViewModel.getDayFormat', context: context);

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
      Atom(name: '_MydocmateViewModel.stepSet', context: context);

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

  late final _$activitySetAtom =
      Atom(name: '_MydocmateViewModel.activitySet', context: context);

  @override
  double get activitySet {
    _$activitySetAtom.reportRead();
    return super.activitySet;
  }

  @override
  set activitySet(double value) {
    _$activitySetAtom.reportWrite(value, super.activitySet, () {
      super.activitySet = value;
    });
  }

  late final _$caloriesSetAtom =
      Atom(name: '_MydocmateViewModel.caloriesSet', context: context);

  @override
  int get caloriesSet {
    _$caloriesSetAtom.reportRead();
    return super.caloriesSet;
  }

  @override
  set caloriesSet(int value) {
    _$caloriesSetAtom.reportWrite(value, super.caloriesSet, () {
      super.caloriesSet = value;
    });
  }

  late final _$setStepPreferencesAsyncAction =
      AsyncAction('_MydocmateViewModel.setStepPreferences', context: context);

  @override
  Future<void> setStepPreferences() {
    return _$setStepPreferencesAsyncAction
        .run(() => super.setStepPreferences());
  }

  @override
  String toString() {
    return '''
switchValue: ${switchValue},
getDayFormat: ${getDayFormat},
stepSet: ${stepSet},
activitySet: ${activitySet},
caloriesSet: ${caloriesSet}
    ''';
  }
}
