import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../services/ebook_service.dart';

class EBookViewModel extends BaseViewModel {
  // final _navigationService = locator<NavigationService>();
  final _ebookServices = locator<EbookService>();
  EbookService get ebookServices => _ebookServices;

  // nextPage() {
  //   _coursesService.uploadCoursePage(notifyListeners, 1);
  // }

  // editCourse(data) {
  //   _coursesService.courseData = data;
  //   _coursesService.uploadCoursePage(notifyListeners, 1);
  // }

  // showCourseDetail(data) {
  //   _coursesService.courseData = data;
  //   _coursesService.uploadCoursePage(notifyListeners, 2);
  // }

  // deleteCourse(key) {
  //   _coursesService.deleteCourseService(key);
  // }

  // publishCourse(key) {
  //   _coursesService.publishCourseService(key);
  //   notifyListeners();
  // }

  // draftCourse(key) {
  //   _coursesService.draftCourseService(key);
  //   notifyListeners();
  // }
}
