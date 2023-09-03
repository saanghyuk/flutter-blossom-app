const API_KEY = "";
const {
  AuthDataModel,
  AuthResponseDataModel
} = require("../dataObject/authDataModel");

class AuthController {
  login = async (req, res) => {
    const { email, password } = req.body;
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
      result = new AuthResponseDataModel(await res.json());
    } catch (error) {
      console.log(error);
      result = {};
    }

    res.json(result);
  };
}

/// 아래처럼 instance 반환하면 어디서 가져가서 쓰든 하나의 인스턴스만 쓰도록
module.exports = new AuthController();
