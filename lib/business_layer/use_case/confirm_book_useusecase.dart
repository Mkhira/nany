
















import 'package:nanny_co/data/model/dto_model/book/book_post_model.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';
import 'package:nanny_co/instance.dart';

class ConfirmBookUseCase extends BaseCase<BookPostModel ,dynamic>{

  final _repository = injector.get<Repository>();
  @override
  Future<dynamic> execute(BookPostModel input) {
    return _repository.confirmBook(input);
  }
}