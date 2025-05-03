import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TrashClassificationPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  TrashClassificationPage({super.key});

  void _showClassificationResult(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.all(20.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 400,
              width: 400,
              child: Lottie.asset(
                'assets/lottie/trash_classification_success.json',
                repeat: false,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(221, 0, 0, 0),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "關閉",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  String _getTrashCategory(String input) {
    // 塑膠類
    if (input.contains("塑膠") || input.contains("塑料") || input.contains("保麗龍") ||
        input.contains("泡沫塑料") || input.contains("塑膠袋") || input.contains("塑料袋") ||
        input.contains("塑膠瓶") || input.contains("塑膠杯") || input.contains("塑膠盒") ||
        input.contains("塑膠桶") || input.contains("塑膠罐") || input.contains("吸管")) {
      return "塑膠屬於可回收垃圾。";
    }

    // 電池類
    if (input.contains("電池") || input.contains("充電電池") || input.contains("鋰電池") ||
        input.contains("乾電池") || input.contains("鈕扣電池")) {
          return "電池屬於有害垃圾，請投放至專用回收點。";
    }
        

    // 廚餘類
    if (input.contains("水果皮") || input.contains("青菜") || input.contains("果核") ||
        input.contains("菜葉") || input.contains("蛋殼") || input.contains("魚骨") ||
        input.contains("雞骨") || input.contains("骨頭") || input.contains("茶葉渣") ||
        input.contains("咖啡渣") || input.contains("剩飯") || input.contains("剩菜")) {
      return "屬於廚餘垃圾。";
    }

    // 紙類
    if (input.contains("紙") || input.contains("書本") || input.contains("雜誌") ||
        input.contains("報紙") || input.contains("海報") || input.contains("證件") ||
        input.contains("信封") || input.contains("紙箱") || input.contains("紙袋") ||
        input.contains("名片") || input.contains("印刷品")) {
      return "紙類屬於可回收垃圾。";
    }

    // 玻璃類
    if (input.contains("玻璃") || input.contains("玻璃瓶") || input.contains("玻璃罐") ||
        input.contains("玻璃杯") || input.contains("玻璃板") || input.contains("酒瓶") ||
        input.contains("醬油瓶") || input.contains("果醬罐") || input.contains("花瓶")) {
      return "玻璃屬於可回收垃圾。";
    }

    // 金屬類
    if (input.contains("鋁罐") || input.contains("雪碧") || input.contains("可樂") ||
        input.contains("啤酒罐") || input.contains("罐頭") || input.contains("鐵罐") ||
        input.contains("易開罐") || input.contains("金屬罐") || input.contains("金屬片")) {
      return "鋁罐屬於可回收垃圾。";
    }

    // 燈具類
    if (input.contains("廢棄燈管") || input.contains("燈泡") || input.contains("LED燈") ||
        input.contains("螢光燈") || input.contains("節能燈") || input.contains("水銀燈")) {
      return "燈管和燈泡屬於有害垃圾，請投放至專用回收點。";
    }

    // 衣物類
    if (input.contains("廢棄衣物") || input.contains("衣服") || input.contains("褲子") ||
        input.contains("襯衫") || input.contains("外套") || input.contains("洋裝") ||
        input.contains("毛衣") || input.contains("圍巾") || input.contains("帽子") ||
        input.contains("背心") || input.contains("睡衣")) {
      return "廢棄衣物可以捐贈或投放至舊衣回收箱。";
    }

    // 一次性餐具類
    if (input.contains("免洗筷") || input.contains("免洗餐具") || input.contains("免洗叉") ||
        input.contains("免洗湯匙") || input.contains("一次性餐具") || input.contains("塑膠餐具")) {
      return "免洗餐具屬於其他垃圾。";
    }

    // 骨頭類
    if (input.contains("骨頭") ||  input.contains("魚骨") || input.contains("雞骨") || input.contains("豬骨") ||input.contains("牛骨") || input.contains("羊骨") ||
        input.contains("魚骨頭") || input.contains("雞骨頭") || input.contains("豬骨頭") || input.contains("牛骨頭") || input.contains("羊骨頭")) {
      return "骨頭屬於廚餘垃圾。";
    }

    // 菸蒂類
    if (input.contains("煙蒂") || input.contains("煙頭") || input.contains("菸蒂") ||
        input.contains("菸頭")) {
      return "煙蒂屬於其他垃圾。";
    }

    // 電子產品類
    if (input.contains("廢舊電子產品") || input.contains("手機") || input.contains("電腦") ||
        input.contains("平板") || input.contains("鍵盤") || input.contains("滑鼠") ||
        input.contains("充電器") || input.contains("印表機") || input.contains("音響")) {
      return "廢舊電子產品屬於有害垃圾，請投放至專用回收點。";
    }

    // 特殊材質類
    if (input.contains("光碟") || input.contains("磁碟") || input.contains("記憶卡") ||
        input.contains("碳粉匣") || input.contains("墨水匣")) {
      return "電子媒體屬於有害垃圾，請投放至專用回收點。";
    }

    return "暫時無法分類，請提供更多資訊！";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '垃圾分類查詢',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 109, 169, 112),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 5,
      ),
      body: Stack(
        children: [
          // 漸變背景
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 輸入框
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "輸入物品名稱",
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    prefixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 109, 169, 112)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                // 查詢按鈕
                ElevatedButton(
                  onPressed: () {
                    String response = _getTrashCategory(_controller.text);
                    _showClassificationResult(context, response);
                    _controller.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                  child: const Text(
                    "查詢",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                // 垃圾分類主題動畫
                Expanded(
                  child: Lottie.asset(
                    'assets/lottie/environment_animation.json',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
