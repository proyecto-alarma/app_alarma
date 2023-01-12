import 'package:flutter/material.dart';
import 'package:project/src/models/users_model.dart';
import 'package:project/src/provider/user_provider.dart';

class CollaboratorPage extends StatefulWidget {
  const CollaboratorPage({super.key});

  @override
  State<CollaboratorPage> createState() => _CollaboratorPageState();
}

class _CollaboratorPageState extends State<CollaboratorPage> {
  late Size _size;
  final _colProvider = UserProvider();
  late Future<UsersModel> _future;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    _future = _colProvider.getusers();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: _size.height * .04,
        ),
        Center(
          child: Image.asset(
            "assets/colaborator.png",
          ),
        ),
        Center(
          child: Text('Colaboradores'),
        ),
        FutureBuilder<UsersModel>(
            future: _future,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final list = snapshot.data!.data ?? [];
              return SizedBox(
                height: _size.height * .5,
                child: ListView(
                  children: List.generate(
                    list.length,
                    (index) => _itemColaborrator(
                      datum: list[index]!,
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }

  Widget _itemColaborrator({
    required Datum datum,
  }) =>
      datum.role == "ADMIN"
          ? const SizedBox()
          : Container(
              margin: EdgeInsets.only(
                top: _size.height * .02,
                left: _size.width * .03,
                right: _size.width * .03,
              ),
              width: _size.width * .8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(
                        0,
                        0,
                        0,
                        .25,
                      ),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      spreadRadius: 0),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          datum.name!,
                        ),
                        Text(
                          datum.email!,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.delete_outline,
                    )
                  ],
                ),
              ),
            );
}
