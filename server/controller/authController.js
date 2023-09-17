const API_KEY = "AIzaSyBPuGF7bXonD8G5-s7nDETpOgcHSFlpjgU";
const {
  AuthDataModel,
  AuthResponseDataModel,
  FirebaseAuthDataModel
} = require("../dataObject/authDataModel");

class AuthController {
  login = async (req, res) => {
    // console.log(req.body);
    let { email, password } = req.body;
    console.log(email);

    if (email == null || password == null) return res.json("args err");

    /// @TODO: Test용 주석
    password = Buffer.from(password, "base64").toString("utf-8");

    /// password를 복호화 해서 넘겨야 한다.
    let result;
    /// HTTP -> Firebase
    /// 자바크스립트에서 클래스와 객체의 구분이 없음.
    try {
      const res = await fetch(
        `https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${API_KEY}`,
        {
          method: "POST",
          headers: { "content-type": "application/json" },
          body: new AuthDataModel({ email, password }).toBody()
        }
      );

      let body = await res.json();
      // @TODO
      /// Firebase 정상/오류 처리
      // result = new AuthResponseDataModel(await res.json());
      let model = AuthResponseDataModel.prototype.json({
        authType: "Firebase",
        body
      });

      // const sample = {
      //   code: 200,
      //   body: {
      //     authType: "Firebase"
      //     //... email, displayName, idToken, refreshToken, expiresIn
      //   }
      // };

      result = model;
    } catch (error) {
      result = {};
    }

    res.json(result);
  };
}

/// 아래처럼 instance 반환하면 어디서 가져가서 쓰든 하나의 인스턴스만 쓰도록
module.exports = new AuthController();
