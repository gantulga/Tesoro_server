import React, { Component } from "react";
import { Link } from "react-router-dom";
import MenuItemChilds from "./MenuItemChilds";

export default class MenuItem extends Component {
  render() {
    if (this.props.menuGroups.length > 0) {
      var haveAccess = false;
      this.props.menuGroups.map((group) => {
        if (this.props.userGroups.includes(group) === true) {
          haveAccess = true;
        }
        return null;
      });
      if (haveAccess === true) {
        if (this.props.childs.length !== 0) {
          return (
            <li className="nav-item has-treeview">
              <a href="fake-link" className="nav-link">
                <i className={this.props.menuClass} />
                <p>
                  {this.props.menuName}
                  <i className="right fas fa-angle-left" />
                </p>
              </a>
              <MenuItemChilds
                childs={this.props.childs}
                userGroups={this.props.userGroups}
              />
            </li>
          );
        } else {
          return (
            <li className="nav-item has-treeview">
              <Link to={this.props.menuUrl} className="nav-link">
                <i className={this.props.menuClass} />
                <p>{this.props.menuName}</p>
              </Link>
            </li>
          );
        }
      }
      return null;
    } else {
      if (this.props.childs.length !== 0) {
        return (
          <li className="nav-item has-treeview">
            <a href="#/" className="nav-link">
              <i className={this.props.menuClass} />
              <p>
                {this.props.menuName}
                <i className="right fas fa-angle-left" />
              </p>
            </a>
            <MenuItemChilds childs={this.props.childs} />
          </li>
        );
      } else {
        return (
          <li className="nav-item has-treeview">
            <Link to={this.props.menuUrl} className="nav-link">
              <i className={this.props.menuClass} />
              <p>{this.props.menuName}</p>
            </Link>
          </li>
        );
      }
    }
  }
}
