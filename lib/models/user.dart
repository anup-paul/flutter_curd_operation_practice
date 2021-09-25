
class AriticalFetch {
    AriticalFetch({
        this.msg,
        this.data,
    });

    String? msg;
    List<Datum>? data;

    factory AriticalFetch.fromJson(Map<String, dynamic> json) => AriticalFetch(
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.firstName,
        this.lastName,
        this.mobile,
        this.image,
        this.v,
    });

    String? id;
    String? firstName;
    String? lastName;
    String? mobile;
    String? image;
    int? v;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobile: json["mobile"],
        image: json["image"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "mobile": mobile,
        "image": image,
        "__v": v,
    };
}
