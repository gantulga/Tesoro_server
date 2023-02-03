import React, { Component } from "react";
import ContentHeader from "../../../Main/Components/ContentHeader";

export default class index extends Component {
  render() {
    return (
      <div>
        <ContentHeader {...this.props} />
        Room Timelines!
      </div>
    );
  }
}
