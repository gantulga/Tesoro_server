import React, { Component } from "react";
import MenuItemChild from "./MenuItemChild";

export default class MenuItemChilds extends Component {
  render() {
    return (
      <ul className="nav nav-treeview">
        {this.props.childs.map((el, index) => {
          var haveAccess = false;
          el.groups.map((group) => {
            if (this.props.userGroups.includes(group) === true) {
              haveAccess = true;
            }
            return null;
          });
          if (haveAccess === true) {
            return (
              <MenuItemChild
                key={index + 1}
                menuName={el.menuName}
                menuUrl={el.menuUrl}
                menuComponent={el.menuComponent}
              />
            );
          } else {
            return null;
          }
        })}
      </ul>
    );
  }
}
