import React from "react";
import { getUser } from "../../Utils/Auth";

function UserPanel() {
  return (
    <div className="user-panel mt-3 pb-3 mb-3 d-flex">
      {/* <div className="image">
        <img
          src="/dist/img/user2-160x160.jpg"
          className="img-circle elevation-2"
          alt="User"
        /> 
      </div> */}
      <div className="info sideBarUsername">{getUser()}</div>
    </div>
  );
}

export default UserPanel;
