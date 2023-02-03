import React, { Component } from "react";
import { Route, Switch } from "react-router-dom";

import Hotel from "../../Hotel";
import NoPermission from "../Pages/NoPermission";

export default class index extends Component {
  render() {
    return (
      <div className="content-wrapper">
        <section className="content">
          <div className="container-fluid">
            <Switch>
              {this.props.userGroups
                ? this.props.userGroups.map((group, index) => {
                    if (group === 14 || group === 2 || group === 1) {
                      return (
                        <Route
                          key={index}
                          path="/hotel"
                          render={(props) => <Hotel {...this.props} />}
                        />
                      );
                    } else {
                      return null;
                    }
                  })
                : null}
              <Route
                path="/"
                render={(props) => (
                  <NoPermission
                    contentHeader={"Хяналтын самбар"}
                    {...this.props}
                  />
                )}
              />
            </Switch>
          </div>
        </section>
      </div>
    );
  }
}
