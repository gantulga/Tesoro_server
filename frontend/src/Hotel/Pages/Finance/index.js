import React, { Component } from "react";
// import { getLogs } from "./Components/LogRobots";
import ContentHeader from "../../../Main/Components/ContentHeader";
import { Modal, Button, InputGroup, FormControl } from "react-bootstrap";
import { store } from "react-notifications-component";
import { fetchPost } from "../RoomStatus/Robots/FetchPostRobot";
import { fetchPut } from "../RoomStatus/Robots/FetchPutRobot";
import { getUserId } from "../../../Main/Utils/Auth";
import Moment from "react-moment";

export default class index extends Component {
  constructor(props) {
    super(props);
    this.state = {
      itemsData: [],
      clientsData: [],
      usersData: [],
      lastShift: null,
      shiftController: null,
      confirmModal: false,
      underpayments: [],
      shiftOrders: [],
      shiftPayments: [],
      wallets: [],
    };
    this.onHide = this.onHide.bind(this);
    this.selectOnChange = this.selectOnChange.bind(this);
    this.createShift = this.createShift.bind(this);
    this.closeShift = this.closeShift.bind(this);
    this.totalPaymentsAmountCalculator = this.totalPaymentsAmountCalculator.bind(
      this
    );
    this.totalShiftUnderCalculator = this.totalShiftUnderCalculator.bind(this);
    this.totalShiftTotalCalculator = this.totalShiftTotalCalculator.bind(this);
    this.totalShiftPaidCalculator = this.totalShiftPaidCalculator.bind(this);
    this.shWorkPaymentsTotalCalculator = this.shWorkPaymentsTotalCalculator.bind(
      this
    );
    this.walletTotalAmount = this.walletTotalAmount.bind(this);
  }

  itemsSetState() {
    fetch(
      "http://" + this.props.ip_address + "/api/division%3D3/item/balances/",
      {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
      }
    )
      .then(async (response) => {
        const data = await response.json();
        this.setState({ itemsData: data });
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

    fetch("http://" + this.props.ip_address + "/api/hotel/beforereceivables/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({ underpayments: data });
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

    fetch("http://" + this.props.ip_address + "/api/hotel/workshiftorders/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({ shiftOrders: data });
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
    fetch("http://" + this.props.ip_address + "/api/hotel/workshiftpayments/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({ shiftPayments: data });
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

    fetch("http://" + this.props.ip_address + "/api/finance/wallets/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({ wallets: data });
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

  totalPaymentsAmountCalculator(payments) {
    var totalAmount = 0;
    payments.map((payment) => {
      totalAmount = parseInt(totalAmount) + parseInt(payment.amount);
      return null;
    });
    return totalAmount;
  }

  totalShiftUnderCalculator() {
    var totalOrderAmount = 0;
    var totalPaymentAmount = 0;
    this.state.shiftOrders.map((order) => {
      totalOrderAmount = parseInt(totalOrderAmount) + parseInt(order.amount);
      order.payments.map((payment) => {
        totalPaymentAmount =
          parseInt(totalPaymentAmount) + parseInt(payment.amount);
        return null;
      });
      return null;
    });
    return parseInt(totalOrderAmount) - parseInt(totalPaymentAmount);
  }

  totalShiftPaidCalculator() {
    var totalPaymentAmount = 0;
    this.state.shiftOrders.map((order) => {
      order.payments.map((payment) => {
        totalPaymentAmount =
          parseInt(totalPaymentAmount) + parseInt(payment.amount);
        return null;
      });
      return null;
    });
    return parseInt(totalPaymentAmount);
  }

  totalShiftTotalCalculator() {
    var totalOrderAmount = 0;
    this.state.shiftOrders.map((order) => {
      totalOrderAmount = parseInt(totalOrderAmount) + parseInt(order.amount);
      return null;
    });
    return parseInt(totalOrderAmount);
  }

  totalUnderpaymentAmountCalculator() {
    var totalOrderAmount = 0;
    var totalPaymentAmount = 0;
    this.state.underpayments.map((order) => {
      totalOrderAmount = parseInt(totalOrderAmount) + parseInt(order.amount);
      order.payments.map((payment) => {
        totalPaymentAmount =
          parseInt(totalPaymentAmount) + parseInt(payment.amount);
        return null;
      });
      return null;
    });
    return parseInt(totalOrderAmount) - parseInt(totalPaymentAmount);
  }

  shWorkPaymentsTotalCalculator() {
    var totalPaymentAmount = 0;
    this.state.shiftPayments.map((payment) => {
      if (payment.shift_work !== this.state.lastShift) {
        totalPaymentAmount =
          parseInt(totalPaymentAmount) + parseInt(payment.amount);
      }
      return null;
    });
    return parseInt(totalPaymentAmount);
  }

  walletTotalAmount(wallet) {
    var totalWalletAmount = 0;
    this.state.shiftPayments.map((payment) => {
      if (payment.wallet.id === wallet.id) {
        totalWalletAmount =
          parseInt(totalWalletAmount) + parseInt(payment.amount);
      }
      return null;
    });
    return totalWalletAmount;
  }

  clientsSetState() {
    fetch("http://" + this.props.ip_address + "/api/division%3D3/clients/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({ clientsData: data });
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

  usersSetState() {
    fetch("http://" + this.props.ip_address + "/api/users/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({ usersData: data });
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

  lastShiftSetState() {
    fetch("http://" + this.props.ip_address + "/api/hotel/shiftWorks/last", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({ lastShift: data[0] });
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
    await this.clientsSetState();
    await this.itemsSetState();
    await this.usersSetState();
    await this.lastShiftSetState();
  }

  modalShow(value) {
    if (value === "new") {
      this.setState({
        confirmModal: true,
        message: "Та шинээр ээлж үүсгэхдээ итгэлтэй байна уу?",
        confirmtype: "new",
      });
    }
    if (value === "close") {
      this.setState({
        confirmModal: true,
        message: "Та ээлжээ хаахдаа итгэлтэй байна уу?",
        confirmtype: "close",
      });
    }
  }

  onHide() {
    this.setState({
      confirmModal: false,
    });
  }

  async createShift() {
    var url = "http://" + this.props.ip_address + "/api/hotel/shiftWorks/";
    var info = {
      created_by: getUserId(),
      worker: getUserId(),
      division: 3,
    };
    let fetchData = fetchPost(info, this.props.token, url);
    var response;
    await fetchData.then(function (val) {
      response = val;
    });
    if (response.ok === true) {
      await this.lastShiftSetState();
      store.addNotification({
        title: "Амжилттай!",
        message: "Ээлжийг амжилттай үүсгэлээ.",
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
      await this.setState({
        confirmModal: false,
      });
    } else {
      store.addNotification({
        title: "Анхаар!",
        message: "Ээлж үүсгэхэд алдаа гарлаа. Системийн админд хандана уу!.",
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

  async closeShift() {
    var url =
      "http://" +
      this.props.ip_address +
      "/api/hotel/shiftWorks/" +
      this.state.lastShift.id +
      "/";
    var info = {
      controller: this.state.shiftController,
      finished: true,
    };
    let fetchData = fetchPut(info, this.props.token, url);
    var response;
    await fetchData.then(function (val) {
      response = val;
    });
    if (response.ok === true) {
      await this.lastShiftSetState();
      store.addNotification({
        title: "Амжилттай!",
        message: "Ээлжийг амжилттай хаалаа.",
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
      await this.setState({
        confirmModal: false,
      });
    } else {
      store.addNotification({
        title: "Анхаар!",
        message: "Ээлж хаахад алдаа гарлаа. Системийн админд хандана уу!.",
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

  selectOnChange(e) {
    e.persist();
    if (e.target.name === "shiftContoller") {
      this.setState({
        shiftController: parseInt(e.target.value),
      });
    }
  }

  render() {
    return (
      <div>
        <ContentHeader {...this.props} />
        <div className="row pb-3">
          <div className="col-sm-6 pl-3">
            Ээлжийн ажилтан:{" "}
            {this.state.lastShift?.finished ? (
              <b className="h4"> Ээлж аваагүй байна.</b>
            ) : (
              <b className="h4">
                {" "}
                {this.props.user} |{" "}
                <Moment format="YYYY/MM/DD">{new Date()}</Moment>
              </b>
            )}
          </div>
          <div className="col-sm-6">
            <Button
              variant="danger"
              onClick={() => this.modalShow("close")}
              size="sm"
              type="submit"
              className="float-right"
              disabled={this.state.lastShift?.finished}
            >
              <i className="fas fa-times" /> <b> Ээлж хаах</b>
            </Button>
            <Button
              variant="success"
              onClick={() => this.modalShow("new")}
              size="sm"
              type="submit"
              className="float-right mr-3"
              disabled={!this.state.lastShift?.finished}
            >
              <i className="fas fa-check" /> <b> Ээлж авах</b>
            </Button>
          </div>
        </div>
        <div className="row d-flex align-items-stretch">
          <div className="col-12 col-sm-6 col-md-6">
            <div className="col-12 align-items-stretch rounded">
              <div className="p-3 text-white-50 mb-3 bg-red rounded box-shadow">
                {"Ээлжээс өмнөх авлагууд".toUpperCase()}
              </div>
              <div className="card bg-light">
                {/* <div className="card-header text-muted border-bottom-0 p-1 pl-2">
                Авлагууд:
              </div> */}
                <div className="card-body p-2 room-card-body">
                  <table width="100%">
                    <thead>
                      <tr>
                        <th>№</th>
                        <th>Өрөө</th>
                        <th className="tableHalignRight">Нийт дүн</th>
                        <th className="tableHalignRight">Төлсөн</th>
                        <th className="tableHalignRight">Дутуу</th>
                        <th className="tableHalignRight">Хэзээ</th>
                      </tr>
                    </thead>
                    <tbody>
                      {this.state.underpayments.map((item, index) => {
                        return (
                          <tr key={index}>
                            <td>{item.id}</td>
                            <td>{item.client.number}</td>
                            <td className="tableHalignRight">{item.amount}₮</td>
                            <td className="tableHalignRight">
                              {this.totalPaymentsAmountCalculator(
                                item.payments
                              )}
                              ₮
                            </td>
                            <td className="tableHalignRight">
                              {item.amount -
                                this.totalPaymentsAmountCalculator(
                                  item.payments
                                )}
                              ₮
                            </td>
                            <td className="tableHalignRight">
                              <Moment format="YYYY/MM/DD">
                                {item.created_at}
                              </Moment>
                            </td>
                          </tr>
                        );
                      })}
                    </tbody>
                    <tfoot>
                      <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th className="tableHalignRight">Нийт дутуу:</th>
                        <th className="tableHalignRight">
                          {this.totalUnderpaymentAmountCalculator()}₮
                        </th>
                        <th></th>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
            </div>
            <div className="col-12 align-items-stretch rounded">
              <div className="p-3 text-white-50 mb-3 bg-green rounded box-shadow">
                {"Ээлжийн өрөө захиалгын тооцоо".toUpperCase()}
              </div>
              <div className="card bg-light">
                {/* <div className="card-header text-muted border-bottom-0 p-1 pl-2">
                Авлагууд:
              </div> */}
                <div className="card-body p-2 room-card-body">
                  <table width="100%">
                    <thead>
                      <tr>
                        <th>№</th>
                        <th>Өрөө</th>
                        <th className="tableHalignRight">Авах</th>
                        <th className="tableHalignRight">Авсан</th>
                        <th className="tableHalignRight">Дутуу</th>
                        <th className="tableHalignRight">Хэзээ</th>
                      </tr>
                    </thead>
                    <tbody>
                      {this.state.shiftOrders.map((item, index) => {
                        return (
                          <tr key={index}>
                            <td>{item.id}</td>
                            <td>{item.client.number}</td>
                            <td className="tableHalignRight">{item.amount}₮</td>
                            <td className="tableHalignRight">
                              {this.totalPaymentsAmountCalculator(
                                item.payments
                              )}
                              ₮
                            </td>
                            <td className="tableHalignRight">
                              {item.amount -
                                this.totalPaymentsAmountCalculator(
                                  item.payments
                                )}
                              ₮
                            </td>
                            <td className="tableHalignRight">
                              <Moment format="YYYY/MM/DD">
                                {item.created_at}
                              </Moment>
                            </td>
                          </tr>
                        );
                      })}
                    </tbody>
                    <tfoot>
                      <tr>
                        <th></th>
                        <th className="tableHalignRight">Нийт:</th>
                        <th className="tableHalignRight">
                          {this.totalShiftTotalCalculator()}₮
                        </th>
                        <th className="tableHalignRight">
                          {this.totalShiftPaidCalculator()}₮
                        </th>
                        <th className="tableHalignRight">
                          {this.totalShiftUnderCalculator()}₮
                        </th>
                        <th></th>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
            </div>
          </div>

          <div className="col-12 col-sm-6 col-md-6">
            {/* <div className="col-12 align-items-stretch rounded">
              <div className="p-3 text-white-50 mb-3 bg-purple rounded box-shadow">
                {"Өрөөний төлөв байдал".toUpperCase()}
              </div>
              <div className="card bg-light">
                {/* <div className="card-header text-muted border-bottom-0 p-1 pl-2">
                Өрөөний байдал:
              </div> 
                <div className="card-body p-0 room-card-body">
                  <table width="100%" className="ml-2 mr-2 mb-2">
                    <thead>
                      <tr>
                        <th>№</th>
                        <th>Өрөө</th>
                        <th>Төлөв</th>
                        <th>Цэвэрлэгээ</th>
                      </tr>
                    </thead>
                    <tbody>
                      {this.state.clientsData.map((client, i) => {
                        if (client.number > 200 && client.number < 999) {
                          return (
                            <tr key={client.id}>
                              <td>{client.id}</td>
                              <td>{client.number}</td>
                              <td>{client.free ? "Хүнгүй" : "Зочинтой"}</td>
                              <td>{client.clean ? "Цэвэрхэн" : "Бохир"}</td>
                            </tr>
                          );
                        } else {
                          return null;
                        }
                      })}
                    </tbody>
                    <tfoot>
                      <tr>
                        <th>№</th>
                        <th>Өрөө</th>
                        <th>Төлөв</th>
                        <th>Цэвэрлэгээ</th>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
            </div> */}
            <div className="col-12 align-items-stretch rounded">
              <div className="p-3 text-white-50 mb-3 bg-primary rounded box-shadow">
                {"Ээлжийн хийсэн нийт гүйлгээ".toUpperCase()}
              </div>
              <div className="card bg-light">
                {/* <div className="card-header text-muted border-bottom-0 p-1 pl-2">
                Авлагууд:
              </div> */}
                <div className="card-body p-2 room-card-body">
                  <table width="100%">
                    <thead>
                      <tr>
                        <th>№</th>
                        <th className="tableHalignRight">Эзэмшигч</th>
                        <th className="tableHalignRight">Данс</th>
                        <th className="tableHalignRight">Дүн</th>
                        <th className="tableHalignRight">Хэзээ</th>
                      </tr>
                    </thead>
                    <tbody>
                      {this.state.shiftPayments.map((item, index) => {
                        if (this.state.lastShift) {
                          return (
                            <tr key={index + 1}>
                              <td>{item.id}</td>
                              <td className="tableHalignRight">
                                {item.wallet.name}
                              </td>
                              <td className="tableHalignRight">
                                {item.wallet.account}
                              </td>
                              <td className="tableHalignRight">
                                {item.amount}₮
                              </td>
                              <td className="tableHalignRight">
                                <Moment format="YYYY/MM/DD HH:mm">
                                  {item.created_at}
                                </Moment>
                              </td>
                            </tr>
                          );
                        } else {
                          return "Ажилтан ээлжээ нээгээгүй байна.";
                        }
                      })}
                    </tbody>
                    <tfoot>
                      <tr>
                        <th className="tableHalignRight"></th>
                        <th className="tableHalignRight"></th>
                        <th className="tableHalignRight">Нийт:</th>
                        <th className="tableHalignRight">
                          {this.shWorkPaymentsTotalCalculator()}₮
                        </th>
                        <th></th>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
            </div>
            <div className="col-12 align-items-stretch rounded">
              <div className="p-3 text-white-50 mb-3 bg-primary rounded box-shadow">
                {"Орлого | дансаар".toUpperCase()}
              </div>
              <div className="card bg-light">
                {/* <div className="card-header text-muted border-bottom-0 p-1 pl-2">
                Авлагууд:
              </div> */}
                <div className="card-body p-2 room-card-body">
                  <table width="100%">
                    <thead>
                      <tr>
                        <th>№</th>
                        <th className="tableHalignRight">Эзэмшигч</th>
                        <th className="tableHalignRight">Данс</th>
                        <th className="tableHalignRight">Дүн</th>
                      </tr>
                    </thead>
                    <tbody>
                      {this.state.wallets.map((wallet, index) => {
                        return (
                          <tr key={index + 1}>
                            <td>{index + 1}</td>
                            <td className="tableHalignRight">{wallet.name}</td>
                            <td className="tableHalignRight">
                              {wallet.account}
                            </td>
                            <td className="tableHalignRight">
                              {this.walletTotalAmount(wallet)}₮
                            </td>
                          </tr>
                        );
                      })}
                    </tbody>
                    <tfoot>
                      <tr>
                        <th></th>
                        <th></th>
                        <th className="tableHalignRight">Нийт:</th>
                        <th className="tableHalignRight">
                          {this.shWorkPaymentsTotalCalculator()}₮
                        </th>
                        <th></th>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <Modal show={this.state.confirmModal} onHide={this.onHide}>
          <Modal.Header closeButton>
            <Modal.Title>Баталгаажуулах!</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <p className="h4">{this.props.user}</p>
            <p>{this.state.message}</p>
            {this.state.confirmtype === "close" ? (
              <InputGroup size="sm">
                <InputGroup.Prepend>
                  <InputGroup.Text id="inputGroup-sizing-sm">
                    Хянагч:
                  </InputGroup.Text>
                </InputGroup.Prepend>
                <FormControl
                  aria-label="Small"
                  aria-describedby="inputGroup-sizing-sm"
                  name="shiftContoller"
                  // onChange={}
                  as="select"
                  value={
                    this.state.shiftController ? this.state.shiftController : 0
                  }
                  onChange={this.selectOnChange}
                  required
                >
                  <option key="0" value="">
                    Хугацааны төрлийг сонгоно уу!
                  </option>
                  {this.state.usersData !== null
                    ? this.state.usersData.map((el, index) => {
                        return (
                          <option key={index + 1} value={el.id}>
                            {el.first_name}
                          </option>
                        );
                      })
                    : null}
                </FormControl>
              </InputGroup>
            ) : null}
          </Modal.Body>
          <Modal.Footer className="modal-footer justify-content-between">
            <Button variant="danger" onClick={this.onHide} size="sm">
              <i className="fas fa-times" /> <b> Буцах</b>
            </Button>
            {this.state.confirmtype === "new" ? (
              <Button variant="success" onClick={this.createShift} size="sm">
                <i className="fas fa-check" /> <b> Үүсгэх</b>
              </Button>
            ) : null}
            {this.state.confirmtype === "close" ? (
              <Button
                variant="danger"
                onClick={this.closeShift}
                size="sm"
                disabled={this.state.shiftController === null ? true : false}
              >
                <i className="fas fa-check" /> <b> Хаах</b>
              </Button>
            ) : null}
          </Modal.Footer>
        </Modal>
      </div>
    );
  }
}
