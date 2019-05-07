import 'package:grpc/grpc.dart';
import 'package:grpc_dart/generated/Common.pb.dart';
import 'package:grpc_dart/generated/HelloWorld.pbgrpc.dart';

Future<void> main(List<String> args) async {
  ///创建通道
  var channel = ClientChannel('localhost',
      port: 10086,
      options: ChannelOptions(credentials: ChannelCredentials.insecure()));

  ///创建客户端
  var client = HelloWorldClient(channel);
  final name = args.isNotEmpty ? args[0] : 'xt.sun';

  try {
    ///发起请求
    var response = await client.sayHello(HelloReq()
      ..name = name
      ..status = Status.REGISTER);

    print('Client -> client { port : ${channel.port} }');
    print(
        'Client -> response { status : ${response.status} , message : ${response.message}}');
  } catch (e) {
    print('Exception - > ${e.toString()}');
  }

  ///关闭连接
  await channel.shutdown();

  print('Client -> shutdwon');
}
