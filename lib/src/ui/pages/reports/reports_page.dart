import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/src/config/theme/theme.dart';
import 'package:project/src/models/report_model.dart';

import '../../../provider/mode_alarma_provider.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late Future<ReportModel> _future;
  final _modelProvider = ModeAlarmaProvider();
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    _future = _modelProvider.report();
  }

  late Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: _size.height * .05,
        ),
        Center(
          child: Text(
            "Eventos detectados",
            style: TextStyle(
              color: purple1Color,
              fontSize: _size.height * .03,
            ),
          ),
        ),
        FutureBuilder<ReportModel>(
            future: _future,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    height: 90,
                    width: 90,
                    child: CircularProgressIndicator(
                      color: purple1Color,
                      strokeWidth: 10,
                      backgroundColor: purple2Color,
                    ),
                  ),
                );
              }
              final list = snapshot.data!.data!.modes ?? [];
              if (list.isEmpty) {
                return Container(
                  margin: EdgeInsets.only(
                    top: _size.height * .2,
                  ),
                  child: const Center(
                    child: Text(
                      "Sin eventos :)",
                    ),
                  ),
                );
              }
              return SizedBox(
                height: _size.height * .8,
                child: ListView(
                  children: List.generate(
                    3,
                    (index) => Container(
                      width: _size.width * .8,
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                .2,
                              ),
                              offset: const Offset(
                                0,
                                2,
                              ),
                              blurRadius: 2,
                              spreadRadius: 2,
                            )
                          ]),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Alarma activada"),
                            Text("Modo: ${list[index]?.mode}"),
                            Text("Estado: ${list[index]?.status}"),
                            Text(
                              "Fecha: ${DateFormat.yMMMd().format(list[index]!.createdAt!)}",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
