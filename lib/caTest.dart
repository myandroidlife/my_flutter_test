import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';





class HomeContent extends StatefulWidget {
  final CameraDescription camera;
  HomeContent({Key key, @required this.camera}) : super(key: key);

  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  CameraController _cameraController;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _cameraController =
        CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the Future is complete, display the preview.
              return Container(
                child: CameraPreview(_cameraController),
              );
            } else {
              // Otherwise, display a loading indicator.
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        SizedBox(height: 30),
        RaisedButton(
          child: Icon(Icons.camera),
          onPressed: () async {
            try {
              await _initializeControllerFuture;
              final dateTime = DateTime.now();
              final path = join((await getApplicationDocumentsDirectory()).path,
                  '${dateTime.millisecondsSinceEpoch}.png');
              await _cameraController.takePicture(path);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ));
              Scaffold.of(context).showSnackBar(SnackBar(content: Text(path)));
            } catch (err, stack) {
              print(err);
            }
          },
        ),
      ],
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picture'),
      ),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}