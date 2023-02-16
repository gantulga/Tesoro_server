import React, { Component } from "react";
import Login from "./Pages/Login";
import Lounge from "../Lounge";
import ReactNotification from "react-notifications-component";
import {
  setUserSession,
  removeUserSession,
  getUser,
  getToken,
  getUserId,
} from "./Utils/Auth";
import "react-notifications-component/dist/theme.css";

export default class index extends Component {
  constructor(props) {
    super(props);
    this.state = {
      token: null,
      user: null,
      isAuthenticated: "",
      ip_address: "112.72.8.158:8000",
      nextPath: "default",
    };
  }

  async signIn(username, token) {
    await setUserSession(token, username, this.state.ip_address);
    this.setState({
      token: token,
      user: username,
    });
  }

  signOut() {
    removeUserSession();
    this.setState({
      token: null,
      user: null,
    });
  }

  render() {
    return (
      <div>
        <ReactNotification />
        {getUser() && getToken() && getUserId() ? (
          <Lounge
            signOut={this.signOut.bind(this)}
            token={getToken()}
            user={getUser()}
            ip_address={this.state.ip_address}
          />
        ) : (
          <Login
            signIn={this.signIn.bind(this)}
            ip_address={this.state.ip_address}
          />
        )}
      </div>
    );
  }
}
