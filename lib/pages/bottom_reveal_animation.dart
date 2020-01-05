import 'package:bottomreveal/bottomreveal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> techies = [
  '@jaycee_victor',
  '@nextdeegit',
  '@hinsikak',
  '@kingsleyiheonye',
  '@dinyangetoh',
  '@Dididcodes',
  '@_jumaallan',
  '@Esidemsam',
  '@Uticodes',
  '@ekene_kristian',
  '@flutterDev',
];

class BottomRevealWidget extends StatefulWidget {
  @override
  _BottomRevealWidgetState createState() => _BottomRevealWidgetState();
}

class _BottomRevealWidgetState extends State<BottomRevealWidget> {
  final BottomRevealController _menuController = BottomRevealController();
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> peeps;

  @override
  void initState() {
    peeps = [
      '@jaycee_victor',
      '@nextdeegit',
      '@hinsikak',
      '@kingsleyiheonye',
      '@dinyangetoh',
      '@Dididcodes',
      '@_jumaallan',
      '@Esidemsam',
      '@Uticodes',
      '@ekene_kristian',
      '@flutterDev',
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top African Twitter Techies'),
      ),
      body: BottomReveal(
        openIcon: Icons.menu,
        closeIcon: Icons.close,
        revealWidth: 100,
        revealHeight: 100,
        backColor: Color(0xff2D0C3F),
        frontColor: Colors.grey.shade200,
        rightContent: _buildRightMenu(),
        bottomContent: _buildBottomContent(),
        controller: _menuController,
        body: AnimatedList(
          key: _listKey,
          initialItemCount: peeps.length,
          itemBuilder: (context, index, anim) {
            return SlideTransition(
              position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
                  .animate(anim),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                padding: const EdgeInsets.all(0),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(peeps[index]),
                  trailing: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _listKey.currentState.removeItem(index,
                            (context, animation) {
                          String removedItem = peeps.removeAt(index);
                          return SizeTransition(
                            sizeFactor: animation,
                            axis: Axis.vertical,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8.0),
                              padding: const EdgeInsets.all(0),
                              child: ListTile(
                                title: Text(removedItem),
                              ),
                            ),
                          );
                        });
                        setState(() {});
                      }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  TextField _buildBottomContent() {
    return TextField(
      style: TextStyle(color: Colors.white, fontSize: 18.0),
      decoration: InputDecoration(
        filled: true,
        hintText: 'Search...',
        hintStyle: TextStyle(color: Colors.white70),
        fillColor: Colors.grey,
        contentPadding: const EdgeInsets.all(16.0),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
            gapPadding: 8.0,
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }

  Column _buildRightMenu() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: Colors.red[700],
          splashColor: Colors.redAccent,
          onPressed: () {
            techies.shuffle();
            peeps.insert(peeps.length, techies[0]);
            _listKey.currentState.insertItem(peeps.length - 1);
            _menuController.close();
            setState(() {});
          },
          mini: true,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(height: 10.0),
        FloatingActionButton(
          backgroundColor: Colors.green[700],
          splashColor: Colors.greenAccent,
          onPressed: () => _menuController.close(),
          mini: true,
          child: Icon(
            Icons.location_on,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(height: 10.0),
        FloatingActionButton(
          backgroundColor: Colors.blue[700],
          splashColor: Colors.blueAccent,
          onPressed: () => _menuController.close(),
          mini: true,
          child: Icon(
            Icons.add_a_photo,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }
}
