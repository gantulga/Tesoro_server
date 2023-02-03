import React, { Component } from "react";
import MenuItem from "./Components/MenuItem";

export default class index extends Component {
  render() {
    return (
      <nav className="mt-2">
        <ul
          className="nav nav-pills nav-sidebar flex-column"
          data-widget="treeview"
          role="menu"
          data-accordion="false"
        >
          {this.props.menuData.map((el, index) => {
            return (
              <MenuItem
                key={index + 1}
                menuName={el.menuName}
                menuClass={el.menuClass}
                menuUrl={el.menuUrl}
                menuComponent={el.menuComponent}
                menuGroups={el.groups}
                childs={el.childs}
                {...this.props}
              />
            );
          })}
          <li className="nav-header">УДИРДЛАГА</li>
          <li className="nav-item">
            <a href="/#" className="nav-link">
              <i className="nav-icon fas fa-phone" />
              <p>Хашка: 8007-8877</p>
            </a>
          </li>
          <li className="nav-item">
            <a href="/#" className="nav-link">
              <i className="nav-icon fas fa-phone" />
              <p>Цаска: 8006-8866</p>
            </a>
          </li>
          <li className="nav-item">
            <a href="/#" className="nav-link">
              <i className="nav-icon fas fa-phone" />
              <p>Баатар: 8085-8668</p>
            </a>
          </li>
          <li className="nav-header">ШУУРХАЙ УТАС</li>
          <li className="nav-item">
            <a href="/#" className="nav-link">
              <i className="nav-icon fas fa-phone" />
              <p>Гал: 7035-101</p>
            </a>
          </li>
          <li className="nav-item">
            <a href="/#" className="nav-link">
              <i className="nav-icon fas fa-phone" />
              <p>Цагдаа: 7035-102</p>
            </a>
          </li>
          <li className="nav-item">
            <a href="/#" className="nav-link">
              <i className="nav-icon fas fa-phone" />
              <p>Түргэн: 7035-103</p>
            </a>
          </li>
          <li className="nav-header">ХОЛБООС</li>
          <li className="nav-item has-treeview">
            <a href="/" className="nav-link" onClick={this.props.signOut}>
              <i className="nav-icon fas fa-sign-out-alt" />
              <p>Системээс гарах</p>
            </a>
          </li>
        </ul>
      </nav>
    );
  }
}
