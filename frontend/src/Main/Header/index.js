import React, { Component } from "react";
import LeftButton from "./Components/LeftButton";
// import SearchForm from "./Components/SearchForm";
// import RightLinks from "./Components/RightLinks";

export default class index extends Component {
  render() {
    return (
      <nav className="main-header navbar navbar-expand navbar-white navbar-light">
        {/* Left navbar links */}
        <LeftButton />
        {/* SEARCH FORM */}
        {/* <SearchForm /> */}
        {/* Right navbar links */}
        {/* <RightLinks /> */}
      </nav>
    );
  }
}
