const { json } = require("express");

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
    if (typeof code !== "number") throw "code type error";
    this.code = code;

    if (!(body instanceof AuthDataModel_Abstract)) throw "body type error";
  }
}

AuthResponseDataModel.prototype.json = function({ code, authType, body }) {
  let _body;
  if (authType === "Firebase") {
    _body = new FirebaseAuthDataModel.prototype.json({json: _body});
  } else {
    _body = new GoogleAuthDataModel();
  }
  return new AuthResponseDataModel({ code, body: _body });
};

class AuthDataModel_Abstract {}
class GoogleAuthDataModel extends AuthDataModel_Abstract {}
class FirebaseAuthDataModel extends AuthDataModel_Abstract {
  constructor({ email, displayName, idToken, refreshToken, expiresIn }) {
    this.email = email;
    this.displayName = displayName;
    this.idToken = idToken;
    this.refreshToken = refreshToken;
    this.expiresIn = expiresIn;
  }
}

FirebaseAuthDataModel.prototype.json({json}) = function({json}){
  return new FirebaseAuthDataModel(json);
}

module.exports = { AuthDataModel, AuthResponseDataModel, FirebaseAuthDataModel, GoogleAuthDataModel, AuthDataModel };
