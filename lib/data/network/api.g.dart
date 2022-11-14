// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AppServiceClient implements AppServiceClient {
  _AppServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://nanny.doctordietapp.com/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginResponseModel> login(loginModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginModel.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginResponseModel> register(registerModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(registerModel.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginResponseModel> updateSister({
    required token,
    full_name,
    user_name,
    email,
    phone,
    dob,
    image,
    city_id,
    gender,
    lat,
    lng,
    address,
    course_name,
    university_name,
    education_city,
    total_experience,
    special_needs,
    ID_type,
    ID_Number,
    min_price,
    max_price,
    lessons_type,
    no_of_children,
    sitter_type,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    if (full_name != null) {
      _data.fields.add(MapEntry(
        'full_name',
        full_name,
      ));
    }
    if (user_name != null) {
      _data.fields.add(MapEntry(
        'user_name',
        user_name,
      ));
    }
    if (email != null) {
      _data.fields.add(MapEntry(
        'email',
        email,
      ));
    }
    if (phone != null) {
      _data.fields.add(MapEntry(
        'phone',
        phone,
      ));
    }
    if (dob != null) {
      _data.fields.add(MapEntry(
        'dob',
        dob,
      ));
    }
    if (image != null) {
      _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(
          image.path,
          filename: image.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    if (city_id != null) {
      _data.fields.add(MapEntry(
        'city_id',
        city_id.toString(),
      ));
    }
    if (gender != null) {
      _data.fields.add(MapEntry(
        'gender',
        gender,
      ));
    }
    if (lat != null) {
      _data.fields.add(MapEntry(
        'lat',
        lat,
      ));
    }
    if (lng != null) {
      _data.fields.add(MapEntry(
        'lng',
        lng,
      ));
    }
    if (address != null) {
      _data.fields.add(MapEntry(
        'address',
        address,
      ));
    }
    if (course_name != null) {
      _data.fields.add(MapEntry(
        'course_name',
        course_name,
      ));
    }
    if (university_name != null) {
      _data.fields.add(MapEntry(
        'university_name',
        university_name,
      ));
    }
    if (education_city != null) {
      _data.fields.add(MapEntry(
        'education_city',
        education_city.toString(),
      ));
    }
    if (total_experience != null) {
      _data.fields.add(MapEntry(
        'total_experience',
        total_experience.toString(),
      ));
    }
    if (special_needs != null) {
      _data.fields.add(MapEntry(
        'special_needs',
        special_needs,
      ));
    }
    if (ID_type != null) {
      _data.fields.add(MapEntry(
        'ID_type',
        ID_type,
      ));
    }
    if (ID_Number != null) {
      _data.fields.add(MapEntry(
        'ID_Number',
        ID_Number,
      ));
    }
    if (min_price != null) {
      _data.fields.add(MapEntry(
        'min_price',
        min_price,
      ));
    }
    if (max_price != null) {
      _data.fields.add(MapEntry(
        'max_price',
        max_price,
      ));
    }
    if (lessons_type != null) {
      _data.fields.add(MapEntry(
        'lessons_type',
        lessons_type.toString(),
      ));
    }
    if (no_of_children != null) {
      _data.fields.add(MapEntry(
        'no_of_children',
        no_of_children,
      ));
    }
    if (sitter_type != null) {
      _data.fields.add(MapEntry(
        'sitter_type',
        sitter_type,
      ));
    }
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/nanny/update-profile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginResponseModel> updateParent({
    required token,
    full_name,
    user_name,
    email,
    phone,
    dob,
    image,
    city_id,
    gender,
    lat,
    lng,
    address,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    if (full_name != null) {
      _data.fields.add(MapEntry(
        'full_name',
        full_name,
      ));
    }
    if (user_name != null) {
      _data.fields.add(MapEntry(
        'user_name',
        user_name,
      ));
    }
    if (email != null) {
      _data.fields.add(MapEntry(
        'email',
        email,
      ));
    }
    if (phone != null) {
      _data.fields.add(MapEntry(
        'phone',
        phone,
      ));
    }
    if (dob != null) {
      _data.fields.add(MapEntry(
        'dob',
        dob,
      ));
    }
    if (image != null) {
      _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(
          image.path,
          filename: image.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    if (city_id != null) {
      _data.fields.add(MapEntry(
        'city_id',
        city_id.toString(),
      ));
    }
    if (gender != null) {
      _data.fields.add(MapEntry(
        'gender',
        gender,
      ));
    }
    if (lat != null) {
      _data.fields.add(MapEntry(
        'lat',
        lat,
      ));
    }
    if (lng != null) {
      _data.fields.add(MapEntry(
        'lng',
        lng,
      ));
    }
    if (address != null) {
      _data.fields.add(MapEntry(
        'address',
        address,
      ));
    }
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/nanny/update-profile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginResponseModel> verifyCode(verifyCodeModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(verifyCodeModel.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/verify-code',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BasicResponseModel> checkEmail(checkEmailModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(checkEmailModel.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BasicResponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/check-email',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BasicResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BasicResponseModel> changePassword(changePassword) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(changePassword.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BasicResponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/change-forget-password',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BasicResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CitiesModel> getCities() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CitiesModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/cities',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CitiesModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FavouriteDto> getFavorite(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<FavouriteDto>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/favorite',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FavouriteDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddFavouriteResponse> addRemoveFavourite(
    token,
    addFavoriteDto,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(addFavoriteDto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddFavouriteResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/favorite/add-remove',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddFavouriteResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SearchForNannyModel> searchForNanny(
    token,
    queries,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SearchForNannyModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/nanny/search',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SearchForNannyModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> addChild({
    required token,
    required name,
    required age,
    required image,
    required gender,
    required special_need,
    id,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.fields.add(MapEntry(
      'name',
      name,
    ));
    _data.fields.add(MapEntry(
      'age',
      age.toString(),
    ));
    _data.files.add(MapEntry(
      'image',
      MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.fields.add(MapEntry(
      'gender',
      gender,
    ));
    _data.fields.add(MapEntry(
      'special_need',
      special_need,
    ));
    if (id != null) {
      _data.fields.add(MapEntry(
        'id',
        id,
      ));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/nanny/add-child',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> deleteChild(
    token,
    id,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id.toJson()};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/nanny/delete-child/{id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<ChildResponse> getChild(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ChildResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/nanny/children',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ChildResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
