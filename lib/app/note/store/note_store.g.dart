// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteStore on NoteStoreBase, Store {
  late final _$noteControllerAtom =
      Atom(name: 'NoteStoreBase.noteController', context: context);

  @override
  TextEditingController get noteController {
    _$noteControllerAtom.reportRead();
    return super.noteController;
  }

  @override
  set noteController(TextEditingController value) {
    _$noteControllerAtom.reportWrite(value, super.noteController, () {
      super.noteController = value;
    });
  }

  late final _$noteListAtom =
      Atom(name: 'NoteStoreBase.noteList', context: context);

  @override
  ObservableList<String> get noteList {
    _$noteListAtom.reportRead();
    return super.noteList;
  }

  @override
  set noteList(ObservableList<String> value) {
    _$noteListAtom.reportWrite(value, super.noteList, () {
      super.noteList = value;
    });
  }

  late final _$positionIdAtom =
      Atom(name: 'NoteStoreBase.positionId', context: context);

  @override
  int? get positionId {
    _$positionIdAtom.reportRead();
    return super.positionId;
  }

  @override
  set positionId(int? value) {
    _$positionIdAtom.reportWrite(value, super.positionId, () {
      super.positionId = value;
    });
  }

  late final _$noteStateAtom =
      Atom(name: 'NoteStoreBase.noteState', context: context);

  @override
  NoteState? get noteState {
    _$noteStateAtom.reportRead();
    return super.noteState;
  }

  @override
  set noteState(NoteState? value) {
    _$noteStateAtom.reportWrite(value, super.noteState, () {
      super.noteState = value;
    });
  }

  late final _$getListAsyncAction =
      AsyncAction('NoteStoreBase.getList', context: context);

  @override
  Future<void> getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  late final _$insertOrUpdateAsyncAction =
      AsyncAction('NoteStoreBase.insertOrUpdate', context: context);

  @override
  Future<bool> insertOrUpdate({required String note}) {
    return _$insertOrUpdateAsyncAction
        .run(() => super.insertOrUpdate(note: note));
  }

  late final _$deleteAsyncAction =
      AsyncAction('NoteStoreBase.delete', context: context);

  @override
  Future<bool> delete({required int noteId}) {
    return _$deleteAsyncAction.run(() => super.delete(noteId: noteId));
  }

  late final _$NoteStoreBaseActionController =
      ActionController(name: 'NoteStoreBase', context: context);

  @override
  void selectToUpdate({required String note, required int noteIndex}) {
    final _$actionInfo = _$NoteStoreBaseActionController.startAction(
        name: 'NoteStoreBase.selectToUpdate');
    try {
      return super.selectToUpdate(note: note, noteIndex: noteIndex);
    } finally {
      _$NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
noteController: ${noteController},
noteList: ${noteList},
positionId: ${positionId},
noteState: ${noteState}
    ''';
  }
}
