import 'package:flutter/material.dart';

const String _pageTitle = 'Page Storage Key';

class ListGridViewPageStorageKeyPage extends StatefulWidget {
  const ListGridViewPageStorageKeyPage({super.key});

  @override
  State<ListGridViewPageStorageKeyPage> createState() =>
      _ListGridViewPageStorageKeyPageState();
}

class _ListGridViewPageStorageKeyPageState
    extends State<ListGridViewPageStorageKeyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_pageTitle),
        centerTitle: true,
      ),
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Container(
                color: Colors.grey[700],
                child: const _ListPage(
                  key: PageStorageKey('FirstPage'),
                ),
              );
            case 1:
              return Container(
                color: Colors.black,
                child: const Center(
                    child: Text(
                  'Blank Page',
                  style: TextStyle(fontSize: 50),
                )),
              );
            case 2:
              return Container(
                color: Colors.grey[700],
                child: const _GridPage(
                  key: PageStorageKey('TreePage'),
                ),
              );
            default:
              throw '404';
          }
        },
      ),
    );
  }
}

class _ListPage extends StatelessWidget {
  const _ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Element - ${index + 1}', style: const TextStyle(fontSize: 30)),
        );
      },
    );
  }
}

class _GridPage extends StatelessWidget {
  const _GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 100,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => GridTile(
        child: Center(
          child: Text(
            'Grid item ${index + 1}',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
