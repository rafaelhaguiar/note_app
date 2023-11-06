import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'note_store.g.dart';

enum NoteState { included, updated, excluded }

class NoteStore = NoteStoreBase with _$NoteStore;

abstract class NoteStoreBase with Store {
  final String _listKey = 'note_list';
  @observable
  TextEditingController noteController = TextEditingController();
  @observable
  ObservableList<String> noteList = ObservableList();
  @observable
  int? positionId;
  @observable
  NoteState? noteState;

  @action
  Future<void> getList() async {
    final storage = await SharedPreferences.getInstance();
    final result = storage.getStringList(_listKey);
    if (result != null) {
      noteList.clear();
      noteList.addAll(result);
    }
  }

  @action
  void selectToUpdate({required String note, required int noteIndex}) {
    noteController.text = note;
    positionId = noteIndex;
  }

  @action
  Future<bool> insertOrUpdate({required String note}) async {
    try {
      positionId != null ? noteList[positionId!] = note : noteList.add(note);
      positionId == null
          ? noteState = NoteState.included
          : noteState = NoteState.updated;
      final storage = await SharedPreferences.getInstance();
      await storage.setStringList(_listKey, noteList);
      positionId = null;
      noteController.clear();
      return true;
    } catch (e) {
      return false;
    }
  }

  @action
  Future<bool> delete({required int noteId}) async {
    try {
      noteList.removeAt(noteId);
      final storage = await SharedPreferences.getInstance();
      await storage.setStringList(_listKey, noteList);
      return true;
    } catch (e) {
      return false;
    }
  }
}
