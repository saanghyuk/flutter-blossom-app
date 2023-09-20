/// {"email":"[user@example.com]","password":"[PASSWORD]","returnSecureToken":true}

class AuthDataModel {
  constructor({ email, password }) {
    this.returnSecureToken = true;
    this.email = email;
    this.password = password;
  }
  toBody = () => JSON.stringify(this);
}

class AuthResponseDataModel {
  constructor({ code, body }) {
    if (typeof code !== "number") throw "code type err";
    this.code = code;
    if (!(body instanceof AuthDataModel_Abstract)) throw "body type err";
    this.body = body;
  }
}
AuthResponseDataModel.prototype.json = function({ authType, body }) {
  let _body;
  let _code;
  if (authType === "Firebase") {
    if (body.error !== undefined && body.error.code === 400) {
      _code = 400;
    } else {
      _code = 200;
    }
    _body = new FirebaseAuthDataModel.prototype.json({ json: body });
  } else {
    _body = new GoogleAuthDataModel();
  }

  return new AuthResponseDataModel({ code: _code, body: _body });
};

AuthResponseDataModel.prototype.authCheck = function({ code, body }) {
  return { code, body };
};

class AuthDataModel_Abstract {}
class GoogleAuthDataModel extends AuthDataModel_Abstract {}
class FirebaseAuthDataModel extends AuthDataModel_Abstract {
  constructor({ email, displayName, idToken, refreshToken, expiresIn }) {
    super();
    this.email = email;
    this.displayName = displayName;
    this.idToken = idToken;
    this.refreshToken = refreshToken;
    this.expiresIn = expiresIn;
    this.authType = "Firebase";
  }
}
FirebaseAuthDataModel.prototype.json = function({ json }) {
  console.log(json);
  return new FirebaseAuthDataModel(json);
};

module.exports = {
  AuthDataModel,
  AuthResponseDataModel,
  FirebaseAuthDataModel,
  GoogleAuthDataModel
};
