
final class QsModel{
    final String? q;

    const QsModel({this.q});

    QsModel.json({required Map<String, dynamic> json}):
        q=json['q']?.toString();
}