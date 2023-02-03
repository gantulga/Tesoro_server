import React, { Component } from "react";
// import { getLogs } from "./Components/LogRobots";
import ContentHeader from "../../../Main/Components/ContentHeader";
import { store } from "react-notifications-component";
import Moment from "react-moment";

export default class index extends Component {
  constructor(props) {
    super(props);
    this.state = {
      itemsData: [],
      clientsData: [],
      usersData: [],
    };
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

  async componentDidMount() {
    await this.clientsSetState();
    await this.itemsSetState();
    await this.usersSetState();
  }

  render() {
    var blockedId = [];
    return (
      <div>
        <ContentHeader {...this.props} />
        <div className="row pb-3">
          <div className="col-sm-12 pl-3">
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
        </div>
        <div className="row d-flex align-items-stretch">
          <div className="col-12 col-sm-6 col-md-6">
            <div className="col-12 align-items-stretch rounded">
              <div className="p-3 text-white-50 mb-3 bg-purple rounded box-shadow">
                {"Барааны нийт дүн".toUpperCase()}
              </div>
              <div className="card card-solid">
                {/* <div className="card-header text-muted border-bottom-0 p-1 pl-2">
                  Нийт:
                </div> */}
                <div className="card-body row">
                  {this.state.itemsData.map((item, i) => {
                    var utga = 0;
                    if (blockedId.includes(item.id)) {
                      return null;
                    } else {
                      this.state.itemsData.map((item2, i2) => {
                        if (item.product != null) {
                          if (item2.product != null) {
                            if (item.product.id === item2.product.id) {
                              if (item.quantity !== null) {
                                utga = utga + item2.quantity;
                              }
                              if (item.size !== null) {
                                utga = utga + item2.size;
                              }
                              blockedId.push(item2.id);
                            }
                          }
                        } else {
                          if (item2.commodity != null) {
                            if (item.commodity.id === item2.commodity.id) {
                              if (item.quantity !== null && item.quantity > 0) {
                                utga = utga + item2.quantity;
                              }
                              if (item.size !== null && item.size > 0) {
                                utga = utga + item2.size;
                              }
                              blockedId.push(item2.id);
                            }
                          }
                        }
                        return null;
                      });
                      return (
                        <div
                          className="col-12 col-sm-6 col-md-6 fontSize-12"
                          key={i}
                        >
                          {item.product ? item.product.name : null}
                          {item.commodity ? item.commodity.name : null} -{" "}
                          {item.quantity !== null ? `${utga}  ш` : null}
                          {item.size !== null
                            ? `${utga}  гр ~ ${utga / 1000} кг`
                            : null}
                        </div>
                      );
                    }
                  })}
                </div>
              </div>
            </div>
            <div className="col-12 align-items-stretch rounded">
              <div className="p-3 text-white-50 mb-3 bg-purple rounded box-shadow">
                {"ЦЭГҮҮДЭД БАЙГАА БАРААНЫ МЭДЭЭЛЭЛ".toUpperCase()}
              </div>
              <div className="row d-flex align-items-stretch">
                {this.state.clientsData.map((client, i) => {
                  if (client.number > 999) {
                    return (
                      <div
                        className="col-12 col-sm-6 col-md-6 align-items-stretch rounded"
                        key={i}
                      >
                        <div className="card bg-light">
                          <div className="card-header text-muted border-bottom-0 p-1 pl-2">
                            {client.description}
                          </div>
                          <div className="card-body p-0 room-card-body">
                            <ul>
                              {this.state.itemsData.map((item, index) => {
                                if (item.client === client.id) {
                                  if (
                                    (item.quantity && item.quantity > 0) ||
                                    (item.size && item.size > 0)
                                  ) {
                                    return (
                                      <li key={index}>
                                        {item.product
                                          ? item.product.name
                                          : null}
                                        {item.commodity
                                          ? item.commodity.name
                                          : null}{" "}
                                        -{" "}
                                        {item.quantity
                                          ? item.quantity + " ш"
                                          : null}
                                        {item.size
                                          ? item.size +
                                            " гр ~ " +
                                            item.size / 1000 +
                                            " кг"
                                          : null}
                                      </li>
                                    );
                                  } else {
                                    return null;
                                  }
                                } else {
                                  return null;
                                }
                              })}
                            </ul>
                          </div>
                        </div>
                      </div>
                    );
                  } else {
                    return null;
                  }
                })}
              </div>
            </div>
            <div className="p-3 text-white-50 mb-3 bg-primary rounded box-shadow">
              {"АЖИЛЧИД АВСАН БАРААНЫ МЭДЭЭЛЭЛ".toUpperCase()}
            </div>
            <div className="row d-flex align-items-stretch">
              {this.state.usersData.map((user, i) => {
                if (user.groups.includes(3)) {
                  return (
                    <div
                      className="col-12 col-sm-6 col-md-6 align-items-stretch rounded"
                      key={i}
                    >
                      <div className="card bg-light">
                        <div className="card-header text-muted border-bottom-0 p-1 pl-2">
                          {user.first_name}
                        </div>
                        <div className="card-body p-0 room-card-body">
                          <ul>
                            {this.state.itemsData.map((item, index) => {
                              if (item.user === user.id) {
                                if (
                                  (item.quantity && item.quantity > 0) ||
                                  (item.size && item.size > 0)
                                ) {
                                  return (
                                    <li key={index}>
                                      {item.product ? item.product.name : null}
                                      {item.commodity
                                        ? item.commodity.name
                                        : null}{" "}
                                      -{" "}
                                      {item.quantity
                                        ? item.quantity + " ш"
                                        : null}
                                      {item.size
                                        ? item.size +
                                          " гр ~ " +
                                          item.size / 1000 +
                                          " кг"
                                        : null}
                                    </li>
                                  );
                                } else {
                                  return null;
                                }
                              } else {
                                return null;
                              }
                            })}
                          </ul>
                        </div>
                      </div>
                    </div>
                  );
                } else {
                  return null;
                }
              })}
            </div>
          </div>
          <div className="col-12 col-sm-6 col-md-6">
            <div className="p-3 text-white-50 mb-3 bg-info rounded box-shadow">
              {"Буудлын өрөөнүүдэд байгаа барааны мэдээлэл".toUpperCase()}
            </div>
            <div className="row d-flex align-items-stretch">
              {this.state.clientsData.map((client, i) => {
                if (client.number > 200 && client.number < 999) {
                  return (
                    <div
                      className="col-12 col-sm-6 col-md-6 align-items-stretch rounded"
                      key={i}
                    >
                      <div className="card bg-light">
                        <div className="card-header text-muted border-bottom-0 p-1 pl-2">
                          {client.number}
                        </div>
                        <div className="card-body p-0 room-card-body">
                          <ul>
                            {this.state.itemsData.map((item, index) => {
                              if (item.client === client.id) {
                                if (
                                  (item.quantity && item.quantity > 0) ||
                                  (item.size && item.size > 0)
                                ) {
                                  return (
                                    <li key={index}>
                                      {item.product ? item.product.name : null}
                                      {item.commodity
                                        ? item.commodity.name
                                        : null}{" "}
                                      -{" "}
                                      {item.quantity
                                        ? item.quantity + " ш"
                                        : null}
                                      {item.size
                                        ? item.size +
                                          " гр ~ " +
                                          item.size / 1000 +
                                          " кг"
                                        : null}
                                    </li>
                                  );
                                } else {
                                  return null;
                                }
                              } else {
                                return null;
                              }
                            })}
                          </ul>
                        </div>
                      </div>
                    </div>
                  );
                } else {
                  return null;
                }
              })}
            </div>
          </div>
        </div>
      </div>
    );
  }
}
