import React, { Component } from "react";

export default class RoomDiv extends Component {
  constructor(props) {
    super(props);
    this.state = {
      products: this.props.data.client_products,
    };
  }

  get_roomRating() {
    const description = this.props.data.description.toLowerCase();
    if (description.includes("энгийн")) {
      return "Энгийн";
    } else if (description.includes("хагас lux")) {
      return "Хагас LUX";
    } else if (
      description.includes("lux") &&
      description.includes("хагас") === false
    ) {
      return "LUX";
    } else if (description.includes("vip")) {
      return "VIP";
    } else {
      return null;
    }
  }

  bed_counter() {
    const description = this.props.data.description;
    if (description.includes("1")) {
      return "1";
    } else if (description.includes("2")) {
      return "2";
    } else {
      return null;
    }
  }

  render() {
    return (
      <div className="col-12 col-sm-4 col-md-3 align-items-stretch">
        <div className="card bg-light">
          <div className="card-header text-muted border-bottom-0">
            <b>{this.props.data.number}</b>

            {this.props.data.room_clean ? (
              <div className="float-right ml-3">
                <i className="fas fa-broom clean fa-xs"></i>
              </div>
            ) : (
              <button
                className="btn btn-primary-outline float-right noBorderButton ml-3"
                onClick={() =>
                  this.props.pageShow("cleanInfo", this.props.data)
                }
                title="Өрөөг цэвэрлэж дууссан."
              >
                <i className="fas fa-broom dirty fa-xs"></i>
              </button>
            )}
            <button
              className="btn btn-primary-outline float-right noBorderButton ml-3"
              onClick={() =>
                this.props.pageShow("minibarModal", this.props.data)
              }
              title="Минибар дах бараа."
            >
              <i
                className={`fas fa-beer fa-xs ${
                  this.props.data.minibarFull ? "clean" : "notFull"
                }`}
              ></i>
            </button>
            {this.props.data.room_free ? (
              <div className="float-right">
                <i className="fas fa-door-open clean fa-xs"></i>
              </div>
            ) : (
              <button
                className="btn btn-primary-outline float-right noBorderButton"
                onClick={() => this.props.pageShow("freeInfo", this.props.data)}
                title="Өрөөнд орсон хүн нь гарсан."
              >
                <i className="fas fa-door-open notFull fa-xs"></i>
              </button>
            )}
          </div>
          <div
            className={`card-body pt-2 pb-2 room-card-body ${
              this.props.data.room_free ? "free" : "notfree"
            }`}
          >
            <div>
              <i className="fas fa-bed"> </i> :&nbsp;{" "}
              <b>{this.bed_counter()}</b>
            </div>
            <div>
              <i className="fas fa-star"> </i> :&nbsp;{" "}
              <b> {this.get_roomRating()}</b>
            </div>
            {this.state.products.map((el, index) => {
              var faIcon = index === 0 ? "fas fa-cloud-moon" : "fas fa-clock";
              return (
                <div key={index + 1}>
                  <i className={faIcon}> </i> :&nbsp;
                  <b> {el.cost.slice(0, -6)}'0₮</b>
                </div>
              );
            })}
          </div>
          <div className="card-footer">
            <div className="text-right">
              <button
                className="btn btn-sm bg-teal"
                onClick={() => this.props.pageShow(1, this.props.data)}
                title="Шинэ захиалга үүсгэх."
              >
                <i className="fas fa-plus" />
              </button>
              <button
                className="btn btn-sm btn-primary ml-2"
                onClick={() => this.props.pageShow("orders", this.props.data)}
                title="Өрөөний захиалгуудыг харах"
              >
                <i className="fas fa-file-invoice" />
              </button>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
