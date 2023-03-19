import React, { Component } from "react";
import { store } from "react-notifications-component";
import Select from "react-select";

export default class Login extends Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: "",
      loginError: "",
      usersData: [],
      ordersData: [],
    };
    this.onChange = this.onChange.bind(this);
    this.submitForm = this.submitForm.bind(this);
    this.handleClear = this.handleClear.bind(this);
    this.handleNumber = this.handleNumber.bind(this);
    this.handleRefresh = this.handleRefresh.bind(this);
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
            container: "bottom-right",
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
            container: "bottom-right",
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      });
  }

  componentDidMount() {
    this.getUsersData();
    this.getOrdersData();
  }

  getOrdersData() {
    fetch(
      "http://" + this.props.ip_address + "/api/lounge/loungeUnderPayments/",
      {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      }
    )
      .then((response) => response.json())
      .then(async (orders) => {
        this.setState({ ordersData: orders });
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message: "Backend сервертэй холбогдож чадсангүй." + error,
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      });
  }

  getUsersData() {
    fetch("http://" + this.props.ip_address + "/api/lounge/workers/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((response) => response.json())
      .then(async (users) => {
        this.setState({ usersData: users });
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message: "Backend сервертэй холбогдож чадсангүй." + error,
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      });
  }

  handleNumber(number) {
    this.setState((prevstate) => ({
      password: prevstate.password + number.toString(),
    }));
  }

  handleClear() {
    this.setState((prevState) => ({
      password: prevState.password.slice(0, -1),
    }));
  }

  handleRefresh() {
    this.setState({
      password: null,
    });
  }

  async userChanger(username) {
    await this.setState({
      username: username.username,
    });
  }

  async onChange(e) {
    await this.setState({
      password: e.target.value,
    });
  }

  render() {
    return (
      <div className="lounge-login-page">
        <div className="left">
          <div className="logo">
            <img src="/lounge_app_logo.png" alt="Tesoro Lounge Logo" />
          </div>
          <form onSubmit={this.submitForm}>
            <div className="username">
              <Select
                className="basic-single workerSelector"
                classNamePrefix="select"
                defaultValue=""
                isClearable="true"
                isSearchable="true"
                name="username"
                onChange={(e) => this.userChanger(e)}
                getOptionLabel={(option) => {
                  return option.username;
                }}
                getOptionValue={(option) => {
                  return option.username;
                }}
                options={this.state.usersData}
                placeholder="Нэвтрэх нэр"
              />
            </div>
            <div className="password">
              <input
                type="password"
                className="form-control"
                placeholder="Нууц үг"
                name="password"
                onChange={(e) => this.onChange(e)}
                value={this.state.password ? this.state.password : ""}
              />
            </div>
            <div className="keyboard row pl-0 pr-0 pb-0 m-0">
              <div
                className="number col-4"
                onClick={() => this.handleNumber(1)}
              >
                1
              </div>
              <div
                className="number col-4"
                onClick={() => this.handleNumber(2)}
              >
                2
              </div>
              <div
                className="number col-4"
                onClick={() => this.handleNumber(3)}
              >
                3
              </div>
              <div
                className="number col-4"
                onClick={() => this.handleNumber(4)}
              >
                4
              </div>
              <div
                className="number col-4"
                onClick={() => this.handleNumber(5)}
              >
                5
              </div>
              <div
                className="number col-4"
                onClick={() => this.handleNumber(6)}
              >
                6
              </div>
              <div
                className="number col-4"
                onClick={() => this.handleNumber(7)}
              >
                7
              </div>
              <div
                className="number col-4"
                onClick={() => this.handleNumber(8)}
              >
                8
              </div>
              <div
                className="number col-4"
                onClick={() => this.handleNumber(0)}
              >
                9
              </div>
              <div className="number col-4" onClick={this.handleRefresh}>
                <i className="fa fa-refresh" aria-hidden="true"></i>
              </div>
              <div
                className="number col-4"
                onClick={() => this.handleNumber(0)}
              >
                0
              </div>
              <div className="number col-4" onClick={this.handleClear}>
                <i className="fa fa-arrow-left" aria-hidden="true"></i>
              </div>
            </div>
            <div className="loginButton">
              <button type="submit" className="btn btn-success btn-block">
                Нэвтрэх
              </button>
            </div>
          </form>
        </div>
        {this.state.ordersData.length > 0 ? (
          <div className="dashboard">
            <div className="dashboard-body">
                {this.state.ordersData.map((order, index) => {
                    var payments_total = 0
                    order.payments.map((payment)=>{
                        payments_total = payments_total + parseInt(payment.amount)
                        return null
                    })
                    var color = "default"
                    if(order.division.id === 1){
                        color = "office"
                    }else if(order.division.id === 3){
                        color = "hotel"
                    }else if(order.division.id === 4){
                        color = "restaurant"
                    }else if(order.division.id === 5){
                        color = "lounge"
                    }else if(order.division.id === 6){
                        color = "karaoke"
                    }

                    return (
                        <figure key={index} onClick={() =>this.props.set_order(order.id, order.amount)}>
                            <div className={color + " address"}>
                                {order.division.name} - {order.client.number}
                            </div>
                            <div className="details">
                                {order.order_detials.map((detail, index) => {
                                    return (
                                    <div className="detail" key={index}>
                                        <div className="product">{detail.product.name}</div>
                                        <div className="quantity">{detail.quantity}</div>
                                        <div className="subtotal">
                                        {detail.subtotal.slice(0, -3)}₮
                                        </div>
                                    </div>
                                    );
                                })}
                            </div>
                            <div className="amount">
                                Нийт: {order.discounted_amount - payments_total}₮
                            </div>
                        </figure>
                    );
                })}
            </div>
        </div>
        ) : null}
      </div>
    );
  }
}
