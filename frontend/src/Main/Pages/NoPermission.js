import React, { Component } from "react";
import ContentHeader from "../Components/ContentHeader";

export default class NoPermission extends Component {
  render() {
    return (
      <div>
        <ContentHeader />
        Уучлаарай та ийшээ нэвтрэх эрх алга байна. Системийн зохицуулагчдаа
        хандана уу!
      </div>
    );
  }
}
