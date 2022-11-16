// Mocks generated by Mockito 5.3.2 from annotations
// in home/test/src/presentation/pages/home_page/home_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:core/core.dart' as _i9;
import 'package:dependencies/dependencies.dart' as _i4;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:get_it/get_it.dart' as _i6;
import 'package:home/home.dart' as _i2;
import 'package:home/src/domain/repositories/repositories.dart' as _i3;
import 'package:home/src/domain/usecases/usecases.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHomeModule_0 extends _i1.SmartFake implements _i2.HomeModule {
  _FakeHomeModule_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHomeRepository_1 extends _i1.SmartFake
    implements _i3.HomeRepository {
  _FakeHomeRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_2<L, R> extends _i1.SmartFake implements _i4.Either<L, R> {
  _FakeEither_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HomeFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeFactory extends _i1.Mock implements _i2.HomeFactory {
  MockHomeFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HomeModule create() => (super.noSuchMethod(
        Invocation.method(
          #create,
          [],
        ),
        returnValue: _FakeHomeModule_0(
          this,
          Invocation.method(
            #create,
            [],
          ),
        ),
      ) as _i2.HomeModule);
}

/// A class which mocks [HomeModule].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeModule extends _i1.Mock implements _i2.HomeModule {
  MockHomeModule() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Map<String, _i5.Route<dynamic>> routes(_i5.RouteSettings? settings) =>
      (super.noSuchMethod(
        Invocation.method(
          #routes,
          [settings],
        ),
        returnValue: <String, _i5.Route<dynamic>>{},
      ) as Map<String, _i5.Route<dynamic>>);
  @override
  void inject(_i6.GetIt? getIt) => super.noSuchMethod(
        Invocation.method(
          #inject,
          [getIt],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [GetFirstStatusUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetFirstStatusUseCase extends _i1.Mock
    implements _i7.GetFirstStatusUseCase {
  MockGetFirstStatusUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.HomeRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeHomeRepository_1(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i3.HomeRepository);
  @override
  _i8.Future<_i4.Either<_i9.Failure, bool>> call(_i9.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i8.Future<_i4.Either<_i9.Failure, bool>>.value(
            _FakeEither_2<_i9.Failure, bool>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i8.Future<_i4.Either<_i9.Failure, bool>>);
}

/// A class which mocks [SetDoneFirstUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSetDoneFirstUseCase extends _i1.Mock
    implements _i7.SetDoneFirstUseCase {
  MockSetDoneFirstUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.HomeRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeHomeRepository_1(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i3.HomeRepository);
  @override
  _i8.Future<_i4.Either<_i9.Failure, void>> call(_i9.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i8.Future<_i4.Either<_i9.Failure, void>>.value(
            _FakeEither_2<_i9.Failure, void>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i8.Future<_i4.Either<_i9.Failure, void>>);
}
