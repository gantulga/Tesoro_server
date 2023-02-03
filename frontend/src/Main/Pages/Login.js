import React, { Component } from "react";
import { store } from "react-notifications-component";

export default class Login extends Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: "",
      loginError: "",
    };
    this.onChange = this.onChange.bind(this);
    this.submitForm = this.submitForm.bind(this);
  }

  onChange(e) {
    this.setState({
      [e.target.name]: e.target.value,
    });
  }

  submitForm(e) {
    e.preventDefault();
    const { username, password } = this.state;
    fetch("http://" + this.props.ip_address + "/generate_token/", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        username: username,
        password: password,
      }),
    })
      .then((results) => {
        if (results.status === 400) {
          store.addNotification({
            title: "Анхаар!",
            message: "Нэвтрэх нэр аль эсвэл нууц үг буруу байна!",
            type: "danger",
            insert: "top",
            container: "top-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 5000,
              onScreen: true,
            },
          });
        }
        if (results.status === 200) {
          store.addNotification({
            message: username + " та амжилттай нэвтэрлээ.",
            type: "success",
            insert: "top",
            container: "top-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 5000,
              onScreen: true,
            },
          });
        }
        return results;
      })
      .then((results) => results.json())
      .then((results) => {
        if (results.token) {
          this.props.signIn(username, results.token);
        }
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Алдаа гарлаа. Системийн инженертэй холбогдож хэлнэ үү! Алдааны мэдээлэл: " +
            error,
          type: "danger",
          insert: "top",
          container: "top-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      });
  }

  render() {
    return (
      <div className="login-page">
        <div className="login-box">
          <div className="login-logo">
            <b>TESORO</b> програм
          </div>
          <div className="card">
            <div className="card-body login-card-body">
              <p className="login-box-msg">Нэвтрэх нэр, нууц үгээ хийнэ үү!</p>
              <form onSubmit={this.submitForm}>
                <div className="input-group mb-3">
                  <input
                    type="text"
                    className="form-control"
                    placeholder="Нэвтрэх нэр"
                    name="username"
                    onChange={this.onChange}
                  />
                  <div className="input-group-append">
                    <div className="input-group-text">
                      <span className="fas fa-user" />
                    </div>
                  </div>
                </div>
                <div className="input-group mb-3">
                  <input
                    type="password"
                    className="form-control"
                    placeholder="Нууц үг"
                    name="password"
                    onChange={this.onChange}
                  />
                  <div className="input-group-append">
                    <div className="input-group-text">
                      <span className="fas fa-lock" />
                    </div>
                  </div>
                </div>
                <div className="row">
                  <div className="col-8"></div>
                  <div className="col-4">
                    <button type="submit" className="btn btn-primary btn-block">
                      Нэвтрэх
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
