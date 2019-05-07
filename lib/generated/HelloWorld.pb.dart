///
//  Generated code. Do not modify.
//  source: HelloWorld.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, String;

import 'package:protobuf/protobuf.dart' as $pb;

import 'Common.pbenum.dart' as $0;

class HelloReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('HelloReq', package: const $pb.PackageName('helloworld'))
    ..aOS(1, 'name')
    ..e<$0.Status>(2, 'status', $pb.PbFieldType.OE, $0.Status.REGISTER, $0.Status.valueOf, $0.Status.values)
    ..hasRequiredFields = false
  ;

  HelloReq() : super();
  HelloReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  HelloReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  HelloReq clone() => HelloReq()..mergeFromMessage(this);
  HelloReq copyWith(void Function(HelloReq) updates) => super.copyWith((message) => updates(message as HelloReq));
  $pb.BuilderInfo get info_ => _i;
  static HelloReq create() => HelloReq();
  HelloReq createEmptyInstance() => create();
  static $pb.PbList<HelloReq> createRepeated() => $pb.PbList<HelloReq>();
  static HelloReq getDefault() => _defaultInstance ??= create()..freeze();
  static HelloReq _defaultInstance;

  $core.String get name => $_getS(0, '');
  set name($core.String v) { $_setString(0, v); }
  $core.bool hasName() => $_has(0);
  void clearName() => clearField(1);

  $0.Status get status => $_getN(1);
  set status($0.Status v) { setField(2, v); }
  $core.bool hasStatus() => $_has(1);
  void clearStatus() => clearField(2);
}

class HelloResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('HelloResp', package: const $pb.PackageName('helloworld'))
    ..aOS(1, 'message')
    ..e<$0.Status>(2, 'status', $pb.PbFieldType.OE, $0.Status.REGISTER, $0.Status.valueOf, $0.Status.values)
    ..hasRequiredFields = false
  ;

  HelloResp() : super();
  HelloResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  HelloResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  HelloResp clone() => HelloResp()..mergeFromMessage(this);
  HelloResp copyWith(void Function(HelloResp) updates) => super.copyWith((message) => updates(message as HelloResp));
  $pb.BuilderInfo get info_ => _i;
  static HelloResp create() => HelloResp();
  HelloResp createEmptyInstance() => create();
  static $pb.PbList<HelloResp> createRepeated() => $pb.PbList<HelloResp>();
  static HelloResp getDefault() => _defaultInstance ??= create()..freeze();
  static HelloResp _defaultInstance;

  $core.String get message => $_getS(0, '');
  set message($core.String v) { $_setString(0, v); }
  $core.bool hasMessage() => $_has(0);
  void clearMessage() => clearField(1);

  $0.Status get status => $_getN(1);
  set status($0.Status v) { setField(2, v); }
  $core.bool hasStatus() => $_has(1);
  void clearStatus() => clearField(2);
}

