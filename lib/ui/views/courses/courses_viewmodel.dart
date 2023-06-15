import 'dart:developer';
import 'package:stacked/stacked.dart';

class CoursesViewModel extends BaseViewModel {
  // final _navigationService = locator<NavigationService>();
  var pageNo = 0;
  nextPage() {
    log("=>");
    pageNo += 1;
    notifyListeners();
  }

  backPage() {
    log("<=");
    pageNo -= 1;
    notifyListeners();
  }

  var coursesData = [
    {
      "title":
          "Advanced WordPress & Elementor 2023 | nable with WordPress & Elementor using flexbox containers, custom post types & dynamic contentRating: 4.9 out of 543 reviews9.5 total hours55 lecturesIntermediateCurrent price: \$19.99",
      "rating": 4.5,
      "reated": 500,
      "price": 2323,
      "image": "https://img-b.udemycdn.com/course/480x270/548278_b005_9.jpg"
    },
    {
      "title":
          "Advanced WordPress & Elementor 2023 | Build Dynamic WebsitesBuild ANY website imaginable with WordPress & Elementor using flexbox containers, custom post types & dynamic contentRating: 4.9 out of 543 reviews9.5 total hours55 lecturesIntermediateCurrent price: \$19.99",
      "rating": 4.5,
      "reated": 500,
      "price": 2323,
      "image": "https://img-b.udemycdn.com/course/480x270/548278_b005_9.jpg"
    },
    {
      "title":
          "Advanced WordPress & Elementor 2023 | Build Dynamic WebsitesBuild ANY website imaginable with WordPress & Elementor using flexbox containers, custom post types & dynamic contentRating: 4.9 out of 543 reviews9.5 total hours55 lecturesIntermediateCurrent price: \$19.99",
      "rating": 4.5,
      "reated": 500,
      "price": 2323,
      "image": "https://img-b.udemycdn.com/course/480x270/548278_b005_9.jpg"
    },
    {
      "title":
          "Advanced WordPress & Elementor 2023 | Build Dynamic WebsitesBuild ANY website imaginable with WordPress & Elementor using flexbox containers, custom post types & dynamic contentRating: 4.9 out of 543 reviews9.5 total hours55 lecturesIntermediateCurrent price: \$19.99",
      "rating": 4.5,
      "reated": 500,
      "price": 2323,
      "image": "https://img-b.udemycdn.com/course/480x270/548278_b005_9.jpg"
    },
    {
      "title":
          "Advanced WordPress & Elementor 2023 | Build Dynamic WebsitesBuild ANY website imaginable with WordPress & Elementor using flexbox containers, custom post types & dynamic contentRating: 4.9 out of 543 reviews9.5 total hours55 lecturesIntermediateCurrent price: \$19.99",
      "rating": 4.5,
      "reated": 500,
      "price": 2323,
      "image": "https://img-b.udemycdn.com/course/480x270/548278_b005_9.jpg"
    },
  ];
}
