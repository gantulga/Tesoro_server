import React, { Component } from "react";
import Header from "./Header";
import SideBar from "./SideBar";
import Content from "./Content";
// import Footer from "./Footer";
import { getUserId } from "../Main/Utils/Auth";
import { fetchGet } from "../Hotel/Pages/RoomStatus/Robots/FetchGetRobot";

const menuData = [
  {
    menuName: "Зочид буудал",
    groups: [1, 2, 3, 14, 15],
    menuClass: "nav-icon fas fa-hotel",
    menuUrl: "/#",
    name: "hotelMenu",
    childs: [
      {
        groups: [3, 14],
        menuName: "Өрөө",
        menuUrl: "/hotel/roomStatus",
      },
      {
        groups: [1, 2, 3, 14, 1],
        menuName: "Тооцоо",
        menuUrl: "/hotel/finance/balance",
      },
      {
        groups: [2, 3, 14, 15],
        menuName: "Үйлдэл",
        menuUrl: "/hotel/logs",
      },
      {
        groups: [2, 3, 14],
        menuName: "Төлбөр",
        menuUrl: "/hotel/payments",
      },
      {
        groups: [2, 3, 14],
        menuName: "Барааны үлдэгдэл",
        menuUrl: "/hotel/item/balances",
      },
    ],
  },
];

export default class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      menuData: menuData,
      userGroups: [],
    };
  }

  async checkPermission() {
    var url =
      "http://" + this.props.ip_address + "/api/users/" + getUserId() + "/";
    let userData = fetchGet(url, this.props.token);
    var value;
    await userData.then(function (val) {
      value = val["groups"];
    });
    await this.setState({
      userGroups: value,
    });
  }

  async UNSAFE_componentWillMount() {
    await this.checkPermission();
  }

  render() {
    return (
      <div>
        <Header />
        <SideBar
          signOut={this.props.signOut}
          menuData={this.state.menuData}
          userGroups={this.state.userGroups}
        />
        <Content userGroups={this.state.userGroups} {...this.props} />
        {/* team<Footer /> */}
      </div>
    );
  }
}
