import React, { Component } from "react";
import { store } from "react-notifications-component";
import { getUserId } from "../../../../Main/Utils/Auth";

export default class Keyboard extends Component {
  constructor(props) {
    super(props);
    this.state = {
      walletsData: [],
      wallet_id: 0,
      moneyValue: "",
      payment_division: 5,
      user_id: getUserId(),
    };
    this.set_wallet = this.set_wallet.bind(this);
    this.minusNumber = this.minusNumber.bind(this);
    this.insertPayment = this.insertPayment.bind(this);
  }

  async getWalletsData() {
    fetch("http://" + this.props.ip_address + "/api/finance/wallets/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({
          walletsData: data,
        });
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

  async componentDidMount() {
    await this.getWalletsData();
  }

  async set_wallet(e) {
    await this.setState({
      wallet_id: parseInt(e.target.value),
    });
  }

  addNumber(number) {
    if (this.props.mobile) {
      this.props.passenger(number, "number");
    } else {
      this.setState((prevState) => ({
        moneyValue: prevState.moneyValue + number.toString(),
      }));
    }
  }
  minusNumber() {
    this.setState((prevState) => ({
      moneyValue: prevState.moneyValue.slice(0, -1),
    }));
  }
  async insertPayment() {
    if (
      this.state.wallet_id > 0 &&
      this.state.moneyValue > 0 &&
      this.props.order_id &&
      this.props.shift_worker &&
      !this.props.shift_worker.finished
    ) {
      var paymentObj = {
        created_at: new Date(),
        amount: parseFloat(this.state.moneyValue),
        confirmed_by: parseInt(this.state.user_id),
        created_by: parseInt(this.state.user_id),
        shift_work: parseInt(this.props.shift_worker.id),
        wallet: parseInt(this.state.wallet_id),
        division: parseInt(this.state.payment_division),
        order: this.props.order_id,
      };
      const url = "http://" + this.props.ip_address + "/api/lounge/payments/";
      var response = await fetch(url, {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
        withCredentials: true,
        body: JSON.stringify(paymentObj),
      })
        .then((results) => {
          return results.ok;
        })
        .catch((error) => {
          store.addNotification({
            title: "Алдаа!",
            message: "Гүйлгээний мэдээллийг хадгалах явцад алдаа гарлаа.",
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
      if (response) {
        await this.setState({
          moneyValue: "",
        });
        this.props.paymentInfoReceiver(response);
        store.addNotification({
          title: "Амжилттай!",
          message: "Гүйлгээний мэдээлэл амжилттай хадгалагдлаа!",
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
    } else {
      if (this.state.wallet_id <= 0 || this.state.wallet_id == null) {
        store.addNotification({
          title: "Анхаар!",
          message: "Дансны мэдээллээ сонгоно уу!",
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
      if (this.state.moneyValue <= 0 || this.state.moneyValue == null) {
        store.addNotification({
          title: "Анхаар!",
          message: "Гүйлгээний үнийн дүн 0-ээс дээш байх ёстой!",
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
      if (this.props.order_id <= 0 || this.props.order_id == null) {
        store.addNotification({
          title: "Анхаар!",
          message: "Захиалгын дугаар сонгогдоогүй байна!",
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
      if (this.props.shift_worker <= 0 || this.props.shift_worker == null) {
        store.addNotification({
          title: "Анхаар!",
          message: "Ээлжний ажилтан сонгогдоогүй байна!",
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
      if (this.props.shift_worker.finished) {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Ээлж нээгээгүй байгаа тул ямар нэгэн гүйлгээ хийх боломжгүй!",
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
    }
  }

  render() {
    return (
      <div className="keyboardBox">
        <select
          name="wallet"
          onChange={(e) => this.set_wallet(e)}
          placeholder="Дансаа сонгоно уу!"
        >
          <option value="">Дансаа сонгоно уу!</option>
          {this.state.walletsData.map((wallet, index) => {
            return (
              <option value={wallet.id} key={index}>
                {wallet.name} - {wallet.account}
              </option>
            );
          })}
        </select>
        <input
          className="moneyValue"
          type="text"
          name="moneyValue"
          value={this.state.moneyValue ? this.state.moneyValue : 0}
          onChange={(e) => console.log(e.target.value)}
        />
        <div className="row p-0 keyboard">
          <div className="col-9 p-0 m-0 too row">
            <div className="col-4" onClick={() => this.addNumber(1)}>
              1
            </div>
            <div className="col-4" onClick={() => this.addNumber(2)}>
              2
            </div>
            <div className="col-4" onClick={() => this.addNumber(3)}>
              3
            </div>
            <div className="col-4" onClick={() => this.addNumber(4)}>
              4
            </div>
            <div className="col-4" onClick={() => this.addNumber(5)}>
              5
            </div>
            <div className="col-4" onClick={() => this.addNumber(6)}>
              6
            </div>
            <div className="col-4" onClick={() => this.addNumber(7)}>
              7
            </div>
            <div className="col-4" onClick={() => this.addNumber(8)}>
              8
            </div>
            <div className="col-4" onClick={() => this.addNumber(9)}>
              9
            </div>
            <div className="tegToo" onClick={() => this.addNumber(0)}>
              0
            </div>
          </div>
          <div className="col-3 p-0 m-0 command">
            <div
              className="col-12 p-0 m-0 back"
              onClick={() => this.minusNumber()}
            >
              <i className="fa fa-arrow-left" aria-hidden="true"></i>
            </div>
            <div
              className="col-12 p-0 m-0 enter"
              onClick={() => this.insertPayment()}
            >
              <i className="fa fa-floppy-o" aria-hidden="true"></i>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
