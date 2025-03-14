// 작성자 : 플러터 6기 개발 김지은
// 작성일 : 2025.03.13
// 제출일 : 2025.03.14
// [Dart 기초] 개인 과제 - 콘솔 쇼핑몰
// 필수 정의 구현
// 예시 출력 화면과 동일하게 나오도록 구성하였습니다.

import 'dart:io';

class Product {
  Map<String, int> product = {'shirt': 45000, 'onepiece': 30000, 'shortshirt': 35000, 'shortpants': 38000, 'socs':5000};
}

class ShoppingMall extends Product {

  int totalprice = 0;
  num mycartprice = 0;
  String? inputnumber;
  void chooseNumber() {
    while ( inputnumber != 4 ) { //inputnumber가 4이면 while문 종료
        print('--------------------------------------------------------------------------------------------------------');
        print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
        print('--------------------------------------------------------------------------------------------------------');
        String? input = stdin.readLineSync(); 
        int? inputnumber = int.tryParse(input ?? "");
        switch(inputnumber) {
          case 1:
            showProducts();
            break;          
          case 2:
            addToCart();
            break;
          case 3:
            showTotal();
            break;         
          case 4:
            print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
            return;      
          default:
            print('입력값이 올바르지 않아요 !');
        }       
    }
  } 


  void showTotal() {
    print('장바구니에 $mycartprice원 어치를 담으셨네요 !');
  }

  void showProducts() {
    product.forEach((key, value) {
      print('$key / $value원');
    });
  }

  void addToCart() {
    // 윈도우 한글 입력에 오류가 있는 관계로 영어로 대체했습니다.
    String? inputname;
    print('상품 이름을 입력해 주세요 !');
    inputname = stdin.readLineSync();
    print('상품 개수를 입력해 주세요 !');
    String? inputs = stdin.readLineSync();
    int? inputsum = int.tryParse(inputs ?? "");

    if (inputsum == null) {// null인 경우 검사
      print('입력값이 올바르지 않아요 !');
      return;
    }

    if (inputsum < 0) {//inputsum을 음수로 받았을 경우
      print('0개보다 많은 개수의 상품만 담을 수 있어요 !'); 
      return;
    }

    if ( !product.containsKey(inputname) || inputsum.runtimeType != int ) { // 제품명과 개수가 틀린 입력일 경우 출력. 제품명을 틀렸을때 바로 출력되게 하면 더 좋을듯
      print('입력값이 올바르지 않아요 !');
        return;
    }

    switch(inputname) {
      case 'shirt':
        mycartprice += 45000 * inputsum;
        break;      
      case 'onepiece':
        mycartprice += 30000 * inputsum;
        break;
      case 'shortshirt':
        mycartprice += 35000 * inputsum;
        break;
      case 'shortpants':
        mycartprice += 38000 * inputsum;
        break;
      case 'socs':
        mycartprice += 5000 * inputsum;
        break;
      default:
        break;
    }
    print('장바구니에 상품이 담겼어요 !');
  }

}


void main() {
  ShoppingMall a = ShoppingMall();
  a.chooseNumber();
}