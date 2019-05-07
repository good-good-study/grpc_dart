import 'package:grpc/grpc.dart';
import 'package:grpc_dart/generated/HelloWorld.pbgrpc.dart';

class HelloWorldService extends HelloWorldServiceBase {
  @override
  Future<HelloResp> sayHello(ServiceCall call, HelloReq request) async {
    return HelloResp()
      ..status = request.status
      ..message = request.name;
  }

  Future<void> main(List<String> args) async {
    //创建服务
    var server = Server([new HelloWorldService()]);
    //启动服务
    await server.serve(port: 10086);
    print('Server -> starting');
  }
}
