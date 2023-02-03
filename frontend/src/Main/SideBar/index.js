import React, { Component } from "react";
import BrandLogo from "./Components/BrandLogo";
import UserPanel from "./Components/UserPanel";
import SidebarMenu from "./Components/SidebarMenu";

export default class index extends Component {
  render() {
    return (
      <aside className="main-sidebar sidebar-dark-primary elevation-4">
        <BrandLogo />
        <div className="sidebar">
          <UserPanel />
          <SidebarMenu signOut={this.props.signOut} {...this.props} />
        </div>
      </aside>
    );
  }
}
