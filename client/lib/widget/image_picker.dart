import '../const/all_imports.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(File) getimage;
  const ImagePickerWidget({super.key, required this.getimage});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? selectedfile;
  final ImagePicker imagepicker = ImagePicker();
  _pickImage(ImageSource imageSource) async {
    final file = await imagepicker.pickImage(source: imageSource);
    selectedfile = File(file!.path);
    setState(() {});
    widget.getimage(selectedfile!);
  }

  _backgroundImage() {
    return selectedfile == null
        ? const AssetImage('Assets/profile.png')
        : FileImage(selectedfile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.white,
          radius: MediaQuery.of(context).size.height * 0.07,
          backgroundImage: _backgroundImage(),
        ),
        TextButton(
          child: Text(
            AllStrings.addimage,
            style: TextStyle(
                fontSize: AllDimensions.px20, color: AppColors.purple),
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            _pickImage(ImageSource.camera);
                          },
                          title: Center(child: Text(AllStrings.camera)),
                        ),
                        const Divider(
                          height: 20,
                        ),
                        ListTile(
                          onTap: () {
                            _pickImage(ImageSource.gallery);
                          },
                          title: Center(
                            child: Text(AllStrings.gallery),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
      ],
    );
  }
}
