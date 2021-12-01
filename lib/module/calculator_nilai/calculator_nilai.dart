import 'package:app_kelas_pintar/theme.dart';
import 'package:app_kelas_pintar/widget/public.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController namaSiswa = TextEditingController();
  TextEditingController nilaiUTS = TextEditingController();
  TextEditingController nilaiTugas = TextEditingController();
  TextEditingController nilaiUAS = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String nama = '';
  String nilaiSiswa = '';
  String keterangan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'Input Nilai Siswa'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: TextFormField(
                    controller: namaSiswa,
                    decoration: InputDecoration(
                      labelText: 'Nama Siswa',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextFormField(
                    controller: nilaiTugas,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'input nilai tugas',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextFormField(
                    controller: nilaiUTS,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'input nilai UTS',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextFormField(
                    controller: nilaiUAS,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'input nilai UAS',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    print("object");
                    if (_formKey.currentState!.validate()) {
                      int tugas = int.parse(nilaiTugas.text);
                      int uts = int.parse(nilaiUTS.text);
                      int uas = int.parse(nilaiUAS.text);
                      double hasil = 0.4 * tugas + 0.3 * uts + 0.3 * uas;
                      print("Hasil: $hasil");

                      if (hasil <= 68.0) {
                        keterangan = "Tidak LULUS";
                        showDialog(context,
                            dialogInfo: DialogType.WARNING,
                            namaSiswa: nama,
                            nilai: hasil.toString(),
                            ket: keterangan);
                      } else {
                        keterangan = "LULUS";
                        showDialog(context,
                            dialogInfo: DialogType.SUCCES,
                            namaSiswa: nama,
                            nilai: hasil.toString(),
                            ket: keterangan);
                      }
                      setState(() {
                        nama = namaSiswa.text;
                        nilaiSiswa = hasil.toString();
                      });
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor),
                    child: Center(
                        child: Text(
                      "Hitung Nilai",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Nama Siswa : ' + nama,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Hasil Nilai : ' + nilaiSiswa,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Keterangan : ' + keterangan,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDialog(BuildContext context,
      {required DialogType dialogInfo,
      required String namaSiswa,
      required String nilai,
      required String ket}) {
    AwesomeDialog(
      context: context,
      dialogType: dialogInfo,
      borderSide: BorderSide(color: Colors.green, width: 2),
      width: 500,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Nilai Raport Siswa',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nama Siswa : ' + namaSiswa,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Hasil Nilai : ' + nilai,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Keterangan : ' + ket,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
      showCloseIcon: true,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }
}
