import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../services/ebook_service.dart';

class EBookViewModel extends BaseViewModel {
  // final _navigationService = locator<NavigationService>();
  final _ebookServices = locator<EbookService>();
  EbookService get ebookServices => _ebookServices;

  nextPage() {
    _ebookServices.ebookPageNextPage(notifyListeners, 1);
  }

  editBook(data) {
    _ebookServices.ebookData = data;
    _ebookServices.ebookPageNextPage(notifyListeners, 1);
  }

  showEbookDetail(data) {
    _ebookServices.ebookData = data;
    _ebookServices.ebookPageNextPage(notifyListeners, 2);
  }

  deleteCourse(key) {
 //   _coursesService.deleteCourseService(key);
  }

  publishCourse(key) {
  //  _coursesService.publishCourseService(key);
    notifyListeners();
  }

  draftCourse(key) {
 //   _coursesService.draftCourseService(key);
    notifyListeners();
  }
}
