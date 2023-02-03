import React, { Component } from "react";
import { Route, Switch } from "react-router-dom";
import RoomStatus from "./Pages/RoomStatus";
import RoomLogs from "./Pages/RoomLogs";
import { store } from "react-notifications-component";
import HotelPayments from "./Pages/HotelPayments";
import ItemBalances from "./Pages/ItemBalances";
import Finance from "./Pages/Finance";

export default class index extends Component {
  constructor(props) {
    super(props);
    this.state = {
      deadlineDay: "",
      deadlineTime: "",
      minimumTime: "",
      leaveTime: "",
    };
  }

  getSettingsData() {
    fetch("http://" + this.props.ip_address + "/api/settings/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({
          deadlineDay: data[0].hotel_deadline_time_of_dayService,
          deadlineTime: data[0].hotel_deadline_time_of_timeService,
          startTime: data[0].hotel_start_time_of_timeService,
          minimumTime: data[0].hotel_minimum_time_of_timeService,
          leaveTime: data[0].hotel_must_leave_time,
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

  UNSAFE_componentWillMount() {
    this.getSettingsData();
  }

  render() {
    return (
      <div>
        <Switch>
          <Route
            path="/hotel/roomStatus"
            render={(props) => (
              <RoomStatus
                contentHeader={"Зочид буудлын өрөөнүүд"}
                deadlineDay={this.state.deadlineDay}
                startTime={this.state.startTime}
                deadlineTime={this.state.deadlineTime}
                minimumTime={this.state.minimumTime}
                leaveTime={this.state.leaveTime}
                {...this.props}
              />
            )}
          />
          <Route
            path="/hotel/item/balances"
            render={(props) => (
              <ItemBalances
                contentHeader={"Зочид буудлын барааны үлдэгдэл"}
                {...this.props}
              />
            )}
          />
          <Route
            path="/hotel/finance/balance"
            render={(props) => (
              <Finance
                contentHeader={"Зочид буудлын санхүүгийн тооцоо"}
                {...this.props}
              />
            )}
          />
          <Route
            path="/hotel/logs"
            render={(props) => (
              <RoomLogs
                contentHeader={"Зочид буудлын үйлдлийн бүртгэл"}
                {...this.props}
              />
            )}
          />
          <Route
            path="/hotel/payments"
            render={(props) => (
              <HotelPayments
                contentHeader={"Зочид буудлын тооцоо"}
                {...this.props}
              />
            )}
          />
        </Switch>
      </div>
    );
  }
}
