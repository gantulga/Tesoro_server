import React from "react";
import { Link } from "react-router-dom";

const MenuItemChild = props => {
  return (
    <li className="nav-item">
      <Link to={props.menuUrl} className="nav-link">
        <i className="far fa-circle nav-icon" />
        <p>{props.menuName}</p>
      </Link>
    </li>
  );
};

export default MenuItemChild;
