import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  //MyTextField adında bir sınıf tanımlanır ve StatefulWidget sınıfından türetilir. Bu, MyTextField widget'ının iç durumunu değiştirebileceğimiz anlamına gelir.
  final TextEditingController
      controller; //TextEditingController tipinde bir controller adında bir değişken tanımlanır. Bu denetleyici, metin alanının içeriğini kontrol etmek ve değiştirmek için kullanılır.
  final String
      hintText; // Bir hintText adında bir String değişken tanımlanır. Bu, metin alanında görüntülenecek olan örnek metni temsil eder.
  final bool
      obscureText; //obscureText adında bir bool değişken tanımlanır. Bu, kullanıcının girdiği metni gizlemek için kullanılır. Örneğin, bir şifre giriş alanı için kullanılabilir.
  final bool
      showPasswordIcon; //showPasswordIcon adında bir bool değişken tanımlanır. Bu, şifre giriş alanında şifrenin görünmesini sağlayan bir göz simgesi göstermek için kullanılır. Varsayılan olarak true değerindedir.

  const MyTextField({
    //MyTextField sınıfının bir constructor'ı tanımlanır. Bu constructor, controller, hintText, obscureText ve showPasswordIcon parametrelerini alır ve bunları sınıfın özelliklerine atar.
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.showPasswordIcon = true,
  });

  @override
  State<MyTextField> createState() =>
      _MyTextFieldState(); //_MyTextFieldState adındaki durum sınıfının bir örneğini oluşturur ve döndürür. Durum sınıfı, MyTextField widget'ının iç durumunu yönetir.
}

class _MyTextFieldState extends State<MyTextField> {
  bool showPassword =
      false; //showPassword adında bir bool değişken tanımlanır ve false olarak başlatılır. Bu değişken, şifre giriş alanının şifresini göstermek veya gizlemek için kullanılır.
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget
          .controller, //Metin giriş alanının kontrolcüsü (controller özelliği), widget.controller değeri ile ayarlanır. Bu, metin alanındaki girilen metni kontrol etmek ve değiştirmek için kullanılır.
      obscureText: widget.obscureText &&
          !showPassword, //obscureText özelliği, widget.obscureText değeri true ise ve showPassword değeri false ise true olarak ayarlanır. Bu, şifre girişi yapılacaksa ve şifrenin görüntülenmesi gerekiyorsa metin alanının gizlendiğini belirtir.
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            //Etkin olmayan durumdayken metin alanının kenarlığını belirtir. Bu örnekte, beyaz renkte bir kenarlık tanımlanır.
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            //Odaklandığında metin alanının kenarlığını belirtir. Bu örnekte, gri renkte bir kenarlık tanımlanır.
            borderSide: BorderSide(color: Colors.grey.shade400)),
        fillColor: Colors.grey
            .shade200, //Metin alanının dolgu rengini belirtir. Bu örnekte, açık gri renkte bir dolgu tanımlanır.
        filled:
            true, //Metin alanının dolu olup olmadığını belirtir. Bu örnekte, dolu olmasını sağlamak için true değeri ayarlanır.
        hintText: widget
            .hintText, //Metin alanının içinde görüntülenecek olan örnek metni (hintText) belirtir. Bu değer, widget.hintText değeri ile eşleşir.
        hintStyle: TextStyle(
            color: Colors.grey[
                500]), //Örnek metnin (hint) stilini belirtir. Bu örnekte, gri renkte bir metin stili tanımlanır.
        suffixIcon: widget.showPasswordIcon &&
                widget
                    .obscureText //showPasswordIcon ve obscureText özellikleri true ise, metin alanının sonuna bir simge (suffixIcon) eklenir. Bu simge, şifre girişi yapılıyorsa ve şifrenin görüntülenmesi gerekiyorsa, göz simgesi (IconButton) olarak oluşturulur.
            ? IconButton(
                icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
              )
            : null,
      ),
    );
  }
}
