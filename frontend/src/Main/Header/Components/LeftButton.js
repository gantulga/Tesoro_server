import React from "react";

function LeftButton() {
  return (
    <ul className="navbar-nav">
      <li className="nav-item">
        <a className="nav-link" data-widget="pushmenu" href="fake_url">
          <i className="fas fa-bars" />
        </a>
      </li>
    </ul>
  );
}

export default LeftButton;
