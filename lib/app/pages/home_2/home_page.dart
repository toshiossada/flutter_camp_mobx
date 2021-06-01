import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'home_controller.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = HomeController();

  void _incrementCounter() {
    _controller.incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Com CodeGen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (_) {
                return Text(
                  '${_controller.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Observer(
              builder: (_) {
                return Text(
                  '${_controller.person.firstName} ${_controller.person.lastName}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Primeiro Nome'),
              onChanged: _controller.setFirstName,
              controller: _controller.txtFirstName,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Ultimo Nome'),
              onChanged: _controller.setLastName,
              controller: _controller.txtLastName,
            ),
            IconButton(onPressed: _controller.addPerson, icon: Icon(Icons.person_add)),
            Observer(
              builder: (_) {
                if (_controller.listNames.isEmpty)
                  return CircularProgressIndicator();
                return Expanded(
                  child: ListView.builder(
                    itemCount: _controller.listNames.length,
                    itemBuilder: (_, index) {
                      var person = _controller.listNames[index];
                      return ListTile(
                        leading: Icon(Icons.person),
                        title: Text('${person.firstName} ${person.lastName}'),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
