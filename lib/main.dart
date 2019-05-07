import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc_dart/generated/Common.pbenum.dart';
import 'package:grpc_dart/generated/HelloWorld.pbgrpc.dart';
import 'package:grpc_dart/src/server.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = 'Unkonw';

  void _incrementCounter() {
    request().then((message) {
      setState(() {
        this.message = message;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    HelloWorldService().main(['xt.sun']);
  }

  Future<String> request() async {
    String message;

    ///创建通道
    var channel = ClientChannel(
        'localhost', //如果是手机访问pc,需要pc真实的ip , 通过ipconfig -all 查询 如:192.168.10.103
        port: 10086,
        options: ChannelOptions(credentials: ChannelCredentials.insecure()));

    ///创建客户端
    var client = HelloWorldClient(channel);
    print('Client -> client { port : ${channel.port} }');
    try {
      ///发起请求
      var response = await client.sayHello(HelloReq()
        ..name = 'xt.sun'
        ..status = Status.REGISTER);

      message =
          'Client -> response { status : ${response.status} , message : ${response.message}}';
    } catch (e) {
      message = e.toString();
    }
    print(message);

    ///关闭连接
    await channel.shutdown();

    print('Client -> shutdwon');

    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '请求结果: Response',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Flexible(
                  child: Text(
                '$message',
                style: TextStyle(color: Colors.red, fontSize: 18),
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
