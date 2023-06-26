// Mocks generated by Mockito 5.4.2 from annotations
// in education_flutter_web/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;
import 'dart:html' as _i16;
import 'dart:ui' as _i11;

import 'package:cloud_firestore/cloud_firestore.dart' as _i2;
import 'package:education_flutter_web/services/courses_service.dart' as _i15;
import 'package:education_flutter_web/services/login_service.dart' as _i14;
import 'package:education_flutter_web/services/Model/CoursesModel.dart' as _i7;
import 'package:education_flutter_web/services/Model/userData.dart' as _i4;
import 'package:education_flutter_web/services/signup_service.dart' as _i12;
import 'package:email_otp/email_otp.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:flutter/material.dart' as _i9;
import 'package:image_picker/image_picker.dart' as _i13;
import 'package:mockito/mockito.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

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

class _FakeFirebaseFirestore_0 extends _i1.SmartFake
    implements _i2.FirebaseFirestore {
  _FakeFirebaseFirestore_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEmailOTP_1 extends _i1.SmartFake implements _i3.EmailOTP {
  _FakeEmailOTP_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeuserData_2 extends _i1.SmartFake implements _i4.userData {
  _FakeuserData_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFirebaseAuth_3 extends _i1.SmartFake implements _i5.FirebaseAuth {
  _FakeFirebaseAuth_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFirebaseStorage_4 extends _i1.SmartFake
    implements _i6.FirebaseStorage {
  _FakeFirebaseStorage_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCoursesModel_5 extends _i1.SmartFake implements _i7.CoursesModel {
  _FakeCoursesModel_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i8.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i9.GlobalKey<_i9.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i9.GlobalKey<_i9.NavigatorState>?);
  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i8.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<T?>? navigateWithTransition<T>(
    _i9.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i9.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i8.Transition? transitionClass,
    _i8.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i10.Future<T?>?);
  @override
  _i10.Future<T?>? replaceWithTransition<T>(
    _i9.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i9.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i8.Transition? transitionClass,
    _i8.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i10.Future<T?>?);
  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void popUntil(
    _i9.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i9.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i10.Future<T?>?);
  @override
  _i10.Future<T?>? navigateToView<T>(
    _i9.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i9.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i8.Transition? transition,
    _i8.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i10.Future<T?>?);
  @override
  _i10.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i9.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i10.Future<T?>?);
  @override
  _i10.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i10.Future<T?>?);
  @override
  _i10.Future<T?>? clearStackAndShowView<T>(
    _i9.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i10.Future<T?>?);
  @override
  _i10.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i10.Future<T?>?);
  @override
  _i10.Future<T?>? clearTillFirstAndShowView<T>(
    _i9.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i10.Future<T?>?);
  @override
  _i10.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i9.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i10.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i8.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i8.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<_i8.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i10.Future<_i8.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i10.Future<_i8.SheetResponse<dynamic>?>.value(),
      ) as _i10.Future<_i8.SheetResponse<dynamic>?>);
  @override
  _i10.Future<_i8.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i11.Color? barrierColor = const _i11.Color(2315255808),
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i10.Future<_i8.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i10.Future<_i8.SheetResponse<T>?>.value(),
      ) as _i10.Future<_i8.SheetResponse<T>?>);
  @override
  void completeSheet(_i8.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i8.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i8.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i9.Widget Function(
      _i9.BuildContext,
      _i8.DialogRequest<dynamic>,
      dynamic Function(_i8.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<_i8.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i11.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i11.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i8.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i10.Future<_i8.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i10.Future<_i8.DialogResponse<dynamic>?>.value(),
      ) as _i10.Future<_i8.DialogResponse<dynamic>?>);
  @override
  _i10.Future<_i8.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i11.Color? barrierColor = const _i11.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i10.Future<_i8.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i10.Future<_i8.DialogResponse<T>?>.value(),
      ) as _i10.Future<_i8.DialogResponse<T>?>);
  @override
  _i10.Future<_i8.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    _i11.Color? cancelTitleColor,
    String? confirmationTitle = r'Ok',
    _i11.Color? confirmationTitleColor,
    bool? barrierDismissible = false,
    _i8.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #confirmationTitle: confirmationTitle,
            #confirmationTitleColor: confirmationTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i10.Future<_i8.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i10.Future<_i8.DialogResponse<dynamic>?>.value(),
      ) as _i10.Future<_i8.DialogResponse<dynamic>?>);
  @override
  void completeDialog(_i8.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [SignupService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignupService extends _i1.Mock implements _i12.SignupService {
  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set message(String? _message) => super.noSuchMethod(
        Invocation.setter(
          #message,
          _message,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set profile(dynamic _profile) => super.noSuchMethod(
        Invocation.setter(
          #profile,
          _profile,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set userdata(dynamic _userdata) => super.noSuchMethod(
        Invocation.setter(
          #userdata,
          _userdata,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.FirebaseFirestore get firestore => (super.noSuchMethod(
        Invocation.getter(#firestore),
        returnValue: _FakeFirebaseFirestore_0(
          this,
          Invocation.getter(#firestore),
        ),
        returnValueForMissingStub: _FakeFirebaseFirestore_0(
          this,
          Invocation.getter(#firestore),
        ),
      ) as _i2.FirebaseFirestore);
  @override
  set firestore(_i2.FirebaseFirestore? _firestore) => super.noSuchMethod(
        Invocation.setter(
          #firestore,
          _firestore,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.EmailOTP get myauth => (super.noSuchMethod(
        Invocation.getter(#myauth),
        returnValue: _FakeEmailOTP_1(
          this,
          Invocation.getter(#myauth),
        ),
        returnValueForMissingStub: _FakeEmailOTP_1(
          this,
          Invocation.getter(#myauth),
        ),
      ) as _i3.EmailOTP);
  @override
  set myauth(_i3.EmailOTP? _myauth) => super.noSuchMethod(
        Invocation.setter(
          #myauth,
          _myauth,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set image(_i13.XFile? _image) => super.noSuchMethod(
        Invocation.setter(
          #image,
          _image,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<dynamic> pickImage() => (super.noSuchMethod(
        Invocation.method(
          #pickImage,
          [],
        ),
        returnValue: _i10.Future<dynamic>.value(),
        returnValueForMissingStub: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);
}

/// A class which mocks [LoginService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginService extends _i1.Mock implements _i14.LoginService {
  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set message(String? _message) => super.noSuchMethod(
        Invocation.setter(
          #message,
          _message,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.userData get UserData => (super.noSuchMethod(
        Invocation.getter(#UserData),
        returnValue: _FakeuserData_2(
          this,
          Invocation.getter(#UserData),
        ),
        returnValueForMissingStub: _FakeuserData_2(
          this,
          Invocation.getter(#UserData),
        ),
      ) as _i4.userData);
  @override
  set UserData(_i4.userData? _UserData) => super.noSuchMethod(
        Invocation.setter(
          #UserData,
          _UserData,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.FirebaseAuth get auth => (super.noSuchMethod(
        Invocation.getter(#auth),
        returnValue: _FakeFirebaseAuth_3(
          this,
          Invocation.getter(#auth),
        ),
        returnValueForMissingStub: _FakeFirebaseAuth_3(
          this,
          Invocation.getter(#auth),
        ),
      ) as _i5.FirebaseAuth);
  @override
  set auth(_i5.FirebaseAuth? _auth) => super.noSuchMethod(
        Invocation.setter(
          #auth,
          _auth,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.FirebaseFirestore get firestore => (super.noSuchMethod(
        Invocation.getter(#firestore),
        returnValue: _FakeFirebaseFirestore_0(
          this,
          Invocation.getter(#firestore),
        ),
        returnValueForMissingStub: _FakeFirebaseFirestore_0(
          this,
          Invocation.getter(#firestore),
        ),
      ) as _i2.FirebaseFirestore);
  @override
  set firestore(_i2.FirebaseFirestore? _firestore) => super.noSuchMethod(
        Invocation.setter(
          #firestore,
          _firestore,
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [CoursesService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCoursesService extends _i1.Mock implements _i15.CoursesService {
  @override
  _i2.FirebaseFirestore get firestore => (super.noSuchMethod(
        Invocation.getter(#firestore),
        returnValue: _FakeFirebaseFirestore_0(
          this,
          Invocation.getter(#firestore),
        ),
        returnValueForMissingStub: _FakeFirebaseFirestore_0(
          this,
          Invocation.getter(#firestore),
        ),
      ) as _i2.FirebaseFirestore);
  @override
  set firestore(_i2.FirebaseFirestore? _firestore) => super.noSuchMethod(
        Invocation.setter(
          #firestore,
          _firestore,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.FirebaseStorage get storage => (super.noSuchMethod(
        Invocation.getter(#storage),
        returnValue: _FakeFirebaseStorage_4(
          this,
          Invocation.getter(#storage),
        ),
        returnValueForMissingStub: _FakeFirebaseStorage_4(
          this,
          Invocation.getter(#storage),
        ),
      ) as _i6.FirebaseStorage);
  @override
  set storage(_i6.FirebaseStorage? _storage) => super.noSuchMethod(
        Invocation.setter(
          #storage,
          _storage,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.CoursesModel get courseData => (super.noSuchMethod(
        Invocation.getter(#courseData),
        returnValue: _FakeCoursesModel_5(
          this,
          Invocation.getter(#courseData),
        ),
        returnValueForMissingStub: _FakeCoursesModel_5(
          this,
          Invocation.getter(#courseData),
        ),
      ) as _i7.CoursesModel);
  @override
  set courseData(_i7.CoursesModel? _courseData) => super.noSuchMethod(
        Invocation.setter(
          #courseData,
          _courseData,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get coursesPage => (super.noSuchMethod(
        Invocation.getter(#coursesPage),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set coursesPage(int? _coursesPage) => super.noSuchMethod(
        Invocation.setter(
          #coursesPage,
          _coursesPage,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get uploadCoursesPage => (super.noSuchMethod(
        Invocation.getter(#uploadCoursesPage),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set uploadCoursesPage(int? _uploadCoursesPage) => super.noSuchMethod(
        Invocation.setter(
          #uploadCoursesPage,
          _uploadCoursesPage,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get thubnailUrl => (super.noSuchMethod(
        Invocation.getter(#thubnailUrl),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set thubnailUrl(String? _thubnailUrl) => super.noSuchMethod(
        Invocation.setter(
          #thubnailUrl,
          _thubnailUrl,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get videoThubnailUrl => (super.noSuchMethod(
        Invocation.getter(#videoThubnailUrl),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set videoThubnailUrl(String? _videoThubnailUrl) => super.noSuchMethod(
        Invocation.setter(
          #videoThubnailUrl,
          _videoThubnailUrl,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get assigmentThubnailUrl => (super.noSuchMethod(
        Invocation.getter(#assigmentThubnailUrl),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set assigmentThubnailUrl(String? _assigmentThubnailUrl) => super.noSuchMethod(
        Invocation.setter(
          #assigmentThubnailUrl,
          _assigmentThubnailUrl,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get videoUrl => (super.noSuchMethod(
        Invocation.getter(#videoUrl),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set videoUrl(String? _videoUrl) => super.noSuchMethod(
        Invocation.setter(
          #videoUrl,
          _videoUrl,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get assigmentUrl => (super.noSuchMethod(
        Invocation.getter(#assigmentUrl),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set assigmentUrl(String? _assigmentUrl) => super.noSuchMethod(
        Invocation.setter(
          #assigmentUrl,
          _assigmentUrl,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get progressshow => (super.noSuchMethod(
        Invocation.getter(#progressshow),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set progressshow(int? _progressshow) => super.noSuchMethod(
        Invocation.setter(
          #progressshow,
          _progressshow,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get videoProgress => (super.noSuchMethod(
        Invocation.getter(#videoProgress),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set videoProgress(int? _videoProgress) => super.noSuchMethod(
        Invocation.setter(
          #videoProgress,
          _videoProgress,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get assigmentProgress => (super.noSuchMethod(
        Invocation.getter(#assigmentProgress),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set assigmentProgress(int? _assigmentProgress) => super.noSuchMethod(
        Invocation.setter(
          #assigmentProgress,
          _assigmentProgress,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get imageLooding => (super.noSuchMethod(
        Invocation.getter(#imageLooding),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set imageLooding(bool? _imageLooding) => super.noSuchMethod(
        Invocation.setter(
          #imageLooding,
          _imageLooding,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set image(_i13.XFile? _image) => super.noSuchMethod(
        Invocation.setter(
          #image,
          _image,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set coursesNotifyListeners(dynamic _coursesNotifyListeners) =>
      super.noSuchMethod(
        Invocation.setter(
          #coursesNotifyListeners,
          _coursesNotifyListeners,
        ),
        returnValueForMissingStub: null,
      );
  @override
  void uploadImage({required dynamic Function(_i16.File)? onSelected}) =>
      super.noSuchMethod(
        Invocation.method(
          #uploadImage,
          [],
          {#onSelected: onSelected},
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<dynamic> uploadToStorage(
    dynamic title,
    dynamic type,
    dynamic notifyListeners,
    dynamic newSetState,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadToStorage,
          [
            title,
            type,
            notifyListeners,
            newSetState,
          ],
        ),
        returnValue: _i10.Future<dynamic>.value(),
        returnValueForMissingStub: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);
  @override
  void uploadVideo({required dynamic Function(_i16.File)? onSelected}) =>
      super.noSuchMethod(
        Invocation.method(
          #uploadVideo,
          [],
          {#onSelected: onSelected},
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<dynamic> uploadVideoToStorage(
    dynamic title,
    dynamic type,
    dynamic notifyListeners,
    dynamic newSetState,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadVideoToStorage,
          [
            title,
            type,
            notifyListeners,
            newSetState,
          ],
        ),
        returnValue: _i10.Future<dynamic>.value(),
        returnValueForMissingStub: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);
  @override
  void loadFile({required dynamic Function(_i16.File)? onSelected}) =>
      super.noSuchMethod(
        Invocation.method(
          #loadFile,
          [],
          {#onSelected: onSelected},
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<dynamic> uploadFile(
    dynamic title,
    dynamic type,
    dynamic notifyListeners,
    dynamic newSetState,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadFile,
          [
            title,
            type,
            notifyListeners,
            newSetState,
          ],
        ),
        returnValue: _i10.Future<dynamic>.value(),
        returnValueForMissingStub: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);
  @override
  _i10.Stream<List<_i7.CoursesModel>> coursesStream() => (super.noSuchMethod(
        Invocation.method(
          #coursesStream,
          [],
        ),
        returnValue: _i10.Stream<List<_i7.CoursesModel>>.empty(),
        returnValueForMissingStub: _i10.Stream<List<_i7.CoursesModel>>.empty(),
      ) as _i10.Stream<List<_i7.CoursesModel>>);
}
