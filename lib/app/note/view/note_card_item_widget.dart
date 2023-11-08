import 'package:flutter/material.dart';
import 'package:note_app/app/note/store/note_store.dart';

class NoteCardItemWidget extends StatelessWidget {
  const NoteCardItemWidget({
    super.key,
    required NoteStore store,
    required this.index,
  }) : _store = store;

  final NoteStore _store;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xffdadada), width: 3))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              _store.noteList[index],
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  _store.selectToUpdate(
                      note: _store.noteList[index], noteIndex: index);
                },
                child: Image.asset('assets/images/update.png', height: 35),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () => showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Atenção!'),
                          content: const Text('Deseja realmente excluir?'),
                          actionsAlignment: MainAxisAlignment.spaceEvenly,
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  'Cacelar',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            TextButton(
                                onPressed: () async {
                                  await _store
                                      .delete(noteId: index)
                                      .then((value) {
                                    String msg = '';
                                    value
                                        ? msg = 'Excluído com sucesso'
                                        : 'Erro ao excluir';
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      duration: const Duration(seconds: 1),
                                      backgroundColor:
                                          value ? Colors.green : Colors.red,
                                      content: Text(msg),
                                    ));
                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text(
                                  'Excluir',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        )),
                child: Image.asset('assets/images/delete.png', height: 35),
              ),
            ],
          )
        ],
      ),
    );
  }
}
