import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:note_app/app/note/store/note_store.dart';
import 'package:note_app/app/note/view/note_card_item_widget.dart';
import 'package:note_app/app/shared/widgets/privacy_policy_widget.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late final FocusNode _focusNode;
  late final NoteStore _store;
  late final GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _focusNode.requestFocus();
      }
    });
    _store = NoteStore();
    _store.getList();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff1e4e62),
            Color(0xff2e968f),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Observer(
          builder: (context) {
            return ListView(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height / 2.5,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: _store.noteList.length,
                    itemBuilder: (context, index) {
                      return NoteCardItemWidget(
                        store: _store,
                        index: index,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    focusNode: _focusNode,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.newline,
                    onFieldSubmitted: (value) {
                      if (_formKey.currentState!.validate()) {
                        _store.insertOrUpdate(note: value);
                      }
                    },
                    autofocus: true,
                    controller: _store.noteController,
                    validator: (value) => value != null && value.isNotEmpty
                        ? null
                        : 'Preencha o campo',
                    decoration: const InputDecoration(
                      hintText: 'Digite seu Texto',
                      hintStyle: TextStyle(fontWeight: FontWeight.w900),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [PrivacyPolicyWidget()],
        ),
      ),
    );
  }
}
