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
  constructor({ email, displayName, idToken, refreshToken, expiresIn }) {
    this.email = email;
    this.displayName = displayName;
    this.idToken = idToken;
    this.refreshToken = refreshToken;
    this.expiresIn = expiresIn;
  }
}

module.exports = { AuthDataModel, AuthResponseDataModel };
