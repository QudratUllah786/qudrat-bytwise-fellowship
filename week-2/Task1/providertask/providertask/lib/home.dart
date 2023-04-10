import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertask/change_provider.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    log('---------start------');
    ChangeProvider changeProvider = Provider.of<ChangeProvider>(context,listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          changeProvider.countUpdate();
        },
      child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Provider'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ChangeProvider>(
              builder: (context, value, child) {
                log('this widget');
              return  Text(
                value.count.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
