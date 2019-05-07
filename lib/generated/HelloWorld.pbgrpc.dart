///
//  Generated code. Do not modify.
//  source: HelloWorld.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:grpc/service_api.dart' as $grpc;

import 'dart:core' as $core show int, String, List;

import 'HelloWorld.pb.dart';
export 'HelloWorld.pb.dart';

class HelloWorldClient extends $grpc.Client {
  static final _$sayHello = $grpc.ClientMethod<HelloReq, HelloResp>(
      '/helloworld.HelloWorld/SayHello',
      (HelloReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => HelloResp.fromBuffer(value));

  HelloWorldClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<HelloResp> sayHello(HelloReq request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$sayHello, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class HelloWorldServiceBase extends $grpc.Service {
  $core.String get $name => 'helloworld.HelloWorld';

  HelloWorldServiceBase() {
    $addMethod($grpc.ServiceMethod<HelloReq, HelloResp>(
        'SayHello',
        sayHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => HelloReq.fromBuffer(value),
        (HelloResp value) => value.writeToBuffer()));
  }

  $async.Future<HelloResp> sayHello_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return sayHello(call, await request);
  }

  $async.Future<HelloResp> sayHello($grpc.ServiceCall call, HelloReq request);
}
