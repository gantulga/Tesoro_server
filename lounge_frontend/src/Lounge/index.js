import React, { Component } from "react";
import { Route, Switch } from "react-router-dom";
import Calculation from "./Pages/Calculation";

export default class index extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  UNSAFE_componentWillMount() {}

  render() {
    return (
      <Switch>
        <Route path="/" render={(props) => <Calculation {...this.props} />} />
      </Switch>
    );
  }
}
