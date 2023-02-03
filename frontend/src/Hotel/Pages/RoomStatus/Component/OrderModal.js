import React, { Component } from "react";
import { Modal, Button } from "react-bootstrap";
import PaymentInput from "./PaymentInput";
import ProductInput from "./ProductInput";
import { getUserId } from "../../../../Main/Utils/Auth";
import { store } from "react-notifications-component";
import { getProductCost } from "../Robots/GetProductCost";
import { updateOrder } from "../Robots/OrderUpdateRobot";
import { fetchGet } from "../Robots/FetchGetRobot";
import Moment from "react-moment";

export default class OrderModal extends Component {
  constructor(props) {
    super(props);
    this.state = {
      prevPaid: 0,
      productsList: [],

      productsAmount: 0,
      paymentsList: [],
      paymentsAmount: 0,
      clientsData: null,
    };
    this.updateData = this.updateData.bind(this);
    this.addInput = this.addInput.bind(this);
  }

  getClientsData() {
    fetch("http://" + this.props.ip_address + "/api/division=3/clients/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({
          clientsData: data,
        });
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Алдаа гарлаа. Системийн инженертэй холбогдож хэлнэ үү! Алдааны мэдээлэл: " +
            error,
          type: "danger",
          insert: "top",
          container: "top-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      });
  }

  addProductInput() {
    this.setState({
      productsList: [
        ...this.state.productsList,
        {
          order: this.props.data.id,
          client: null,
          product: null,
          cost: 0,
          maxQuantity: 0,
          subtotal: 0,
          quantity: 0,
          discount: 0,
          created_by: getUserId(),
        },
      ],
    });
  }

  addInput() {
    this.setState({
      paymentsList: [
        ...this.state.paymentsList,
        { wallet: null, amount: 0, confirmed_by: getUserId() },
      ],
    });
  }

  async handleChange(e, index) {
    e.persist();
    if (e.target.name === "wallet") {
      await this.setState((prevState) => {
        const newItems = [...prevState.paymentsList];
        newItems[index].wallet = parseInt(e.target.value);
        return { paymentsList: newItems };
      });
    } else {
      await this.setState((prevState) => {
        const newItems = [...prevState.paymentsList];
        newItems[index].amount = parseInt(e.target.value.split(",").join(""));
        return { paymentsList: newItems };
      });
    }

    var total = 0;
    await this.state.paymentsList.map(async (payment, index) => {
      total += parseInt(payment.amount);
    });
    await this.setState({
      paymentsAmount: total,
    });
  }

  async handleChangeProductList(e, index) {
    e.persist();
    if (e.target.name === "client") {
      await this.setState((prevState) => {
        const newItems = [...prevState.productsList];
        newItems[index].client = parseInt(e.target.value);
        return { productsList: newItems };
      });
    }
    if (e.target.name === "product") {
      var urlBalanceItem =
        "http://" +
        this.props.ip_address +
        "/api/item/balances/" +
        e.target.value +
        "/";
      var data;
      var product = fetchGet(urlBalanceItem, this.props.token);
      await product.then(
        await function (val) {
          data = val;
        }
      );

      let order = getProductCost(
        data.product,
        this.props.token,
        this.props.ip_address
      );
      var cost;
      await order.then(
        await function (val) {
          cost = val["cost"];
        }
      );

      await this.setState((prevState) => {
        const newItems = [...prevState.productsList];
        newItems[index].product = parseInt(data.product);
        newItems[index].cost = parseInt(cost);
        newItems[index].maxQuantity = parseInt(data.quantity);
        newItems[index].subtotal = parseInt(cost) * newItems[index].quantity;
        return { productsList: newItems };
      });
    }
    if (e.target.name === "quantity") {
      var quantity = parseInt(e.target.value.split(",").join(""));
      await this.setState((prevState) => {
        const newItems = [...prevState.productsList];
        var too;
        if (quantity > newItems[index].maxQuantity) {
          too = newItems[index].maxQuantity;
          store.addNotification({
            title: "Анхаар!",
            message:
              "Барааны үлдэгдэл " + newItems[index].maxQuantity + " байна.",
            type: "warning",
            insert: "top",
            container: "top-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 5000,
              onScreen: true,
            },
          });
        } else {
          too = quantity;
        }
        newItems[index].quantity = too;
        if (newItems[index].discount !== 0) {
          newItems[index].subtotal =
            newItems[index].cost * too * newItems[index].discount;
        } else {
          newItems[index].subtotal = newItems[index].cost * too;
        }
        return { productsList: newItems };
      });
    }

    if (e.target.name === "discount") {
      if (e.target.value <= 0 || e.target.value > 100) {
        await this.setState((prevState) => {
          const newItems = [...prevState.productsList];
          newItems[index].discount = 0;
          newItems[index].subtotal =
            newItems[index].cost * newItems[index].quantity;
          return { productsList: newItems };
        });
        store.addNotification({
          title: "Анхаар!",
          message: "Хөнгөлөлтийн % нь 1-100 хооронд байх ёстой! ",
          type: "warning",
          insert: "top",
          container: "top-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      } else {
        await this.setState((prevState) => {
          const newItems = [...prevState.productsList];
          newItems[index].discount = e.target.value;
          newItems[index].subtotal =
            newItems[index].cost *
            newItems[index].quantity *
            ((100 - e.target.value) / 100);
          return { productsList: newItems };
        });
      }
    }

    var total = 0;
    await this.state.productsList.map(async (detial, index) => {
      total += detial.subtotal;
    });
    await this.setState({
      productsAmount: total,
    });
  }

  async prevPaidCalculator() {
    var paid = 0;
    if (this.props.data.payments.length > 0) {
      await this.props.data.payments.map(async (payment, index) => {
        paid = paid + parseInt(payment.amount);
        if (this.props.data.payments.length === index + 1) {
          await this.setState({
            prevPaid: paid,
          });
        }
      });
    } else {
      await this.setState({
        prevPaid: paid,
      });
    }
  }

  async updateData() {
    var hasError = false;
    this.state.paymentsList.map((payment) => {
      if (!payment.wallet) {
        hasError = true;
        store.addNotification({
          title: "Анхаар!",
          message: "Та банкны нэрийг сонгоогүй байна.",
          type: "danger",
          insert: "top",
          container: "top-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      }
      if (!payment.amount && payment.amount !== 0) {
        hasError = true;
        store.addNotification({
          title: "Анхаар!",
          message:
            "Та мөнгөн дүнг бичээгүй байна. Аль эсвэл дүнг 0 гэж бичих шаардлагатай!",
          type: "danger",
          insert: "top",
          container: "top-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      }
      return null;
    });
    this.state.productsList.map((product) => {
      if (!product.product) {
        hasError = true;
        store.addNotification({
          title: "Анхаар!",
          message: "Та барааны нэрийг сонгоогүй байна.",
          type: "danger",
          insert: "top",
          container: "top-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      }
      if (!product.quantity && product.quantity !== 0) {
        hasError = true;
        store.addNotification({
          title: "Анхаар!",
          message:
            "Та та барааны тоо ширхэгийг бичээгүй байна. Аль эсвэл тоо ширхэгийг 0 гэж бичих шаардлагатай!",
          type: "danger",
          insert: "top",
          container: "top-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      }
      return null;
    });
    if (hasError === false) {
      let orderObj = {
        orderId: this.props.data.id,
        orderAmount:
          parseInt(this.props.total) + parseInt(this.state.productsAmount),
        underAmount: parseInt(
          this.props.total +
            parseInt(this.state.productsAmount) -
            this.props.paid -
            parseInt(this.state.paymentsAmount)
        ),
        updated_by: getUserId(),
        updated_at: new Date(),
        detialsList: this.state.productsList,
        paymentsList: this.state.paymentsList,
        client: this.props.roomData.id,
      };
      await updateOrder(orderObj, this.props.token, this.props.ip_address);
      var url =
        "http://" +
        this.props.ip_address +
        "/api/hotel/orders2/" +
        this.props.data.id +
        "/";
      var orderData = fetchGet(url, this.props.token);
      await orderData.then(
        await function (val) {
          orderData = val;
        }
      );
      this.props.onHide();
      this.props.pageShow("order", orderData);
    }
  }

  async componentDidMount() {
    await this.prevPaidCalculator();
    await this.getClientsData();
  }

  render() {
    var uldegdel =
      parseInt(this.props.total) +
      parseInt(this.state.productsAmount) -
      parseInt(this.props.paid);
    return (
      <Modal show={this.props.show} onHide={this.props.onHide} size="lg">
        <Modal.Header closeButton>
          <Modal.Title>Захиалгын мэдээлэл</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <div className="row">
            <div className="col-12 totalAmountDiv">
              <div className="float-left">
                <b>Бүтээгдэхүүнүүд:</b>
              </div>
            </div>
          </div>
          {this.props.data.order_detials.map((detial, index) => (
            <div key={index + 1} className="row">
              <div className="col-12 productDiv">
                <div className="float-left mr-2">{index + 1}</div>
                <div className="float-left name col-7">
                  {detial.product.name}{" "}
                  {detial.fr_date && detial.to_date ? (
                    <span>
                      (<Moment format="MM/DD">{detial.fr_date}</Moment> -
                      <Moment format="MM/DD">{detial.to_date}</Moment>)
                    </span>
                  ) : null}
                </div>
                <div className="float-left price">{detial.product.cost}</div>
                <div className="float-left quantity ml-2 mr-2">
                  x {detial.quantity} ~ {detial.discount}%
                </div>
                <div className="float-right amount">{detial.subtotal}₮</div>
              </div>
            </div>
          ))}
          <hr />
          {this.state.productsList.map((product, index) => {
            return (
              <ProductInput
                key={index}
                handleChange={this.handleChangeProductList.bind(this)}
                productsData={this.state.productsData}
                product={product}
                propKey={index}
                clientsData={this.state.clientsData}
                {...this.props}
              />
            );
          })}
          <div className="row">
            <div className="col-12">
              <div className="float-right">
                <Button
                  variant="success"
                  size="sm"
                  onClick={(e) => this.addProductInput(e)}
                >
                  <i className="fas fa-plus" /> Бараа нэмэх
                </Button>
              </div>
            </div>
          </div>
          <hr />
          <div className="row">
            <div className="col-12 totalAmountDiv">
              <div className="float-left mr-2">#</div>
              <div className="float-left">Нийт дүн:</div>
              <div className="float-right totalAmount">
                {parseInt(
                  this.props.total + parseInt(this.state.productsAmount)
                )}
                ₮
              </div>
            </div>
          </div>
          <div className="row">
            <div className="col-12 totalAmountDiv">
              <div className="float-left mr-2">#</div>
              <div className="float-left">Төлсөн дүн:</div>
              <div className="float-right totalAmount success">
                {this.props.paid + parseInt(this.state.paymentsAmount)}₮
              </div>
            </div>
          </div>
          <div className="row">
            <div className="col-12 totalAmountDiv">
              <div className="float-left mr-2">#</div>
              <div className="float-left">Үлдэгдэл дүн:</div>
              <div className="float-right totalAmount unsuccess">
                {parseInt(
                  this.props.total +
                    parseInt(this.state.productsAmount) -
                    this.props.paid -
                    parseInt(this.state.paymentsAmount)
                )}
                ₮
              </div>
            </div>
          </div>
          <hr />
          <div className="row">
            <div className="col-12 totalAmountDiv">
              <div className="float-left">
                <b>Гүйлгээнүүд:</b>
              </div>
            </div>
          </div>
          {this.props.data.payments.map((payment, index) => (
            <div key={index + 1} className="row">
              <div className="col-12 productDiv">
                <div className="float-left mr-2">{index + 1}</div>
                <div className="float-left name col-7">
                  {payment.wallet.bank} {payment.wallet.name}{" "}
                  {payment.wallet.account}
                </div>
                <div className="float-right amount">{payment.amount}₮</div>
              </div>
            </div>
          ))}
          {!this.props.data.payments.length
            ? "Төлбөрийн гүйлгээ хийгдээгүй байна."
            : null}
          <hr />
          {this.state.paymentsList.map((data, index) => {
            return (
              <PaymentInput
                key={index}
                handleChange={this.handleChange.bind(this)}
                wallet={data.wallet}
                amount={data.amount}
                tulhuur={index}
                walletsData={this.props.walletsData}
                {...this.props}
              />
            );
          })}
          <hr />
          {uldegdel !== 0 ? (
            <div className="row">
              <div className="col-12">
                <div className="float-right">
                  <Button
                    variant="success"
                    size="sm"
                    onClick={(e) => this.addInput(e)}
                  >
                    <i className="fas fa-plus" /> Банк нэмэх
                  </Button>
                </div>
              </div>
            </div>
          ) : null}
        </Modal.Body>
        <Modal.Footer className="modal-footer justify-content-between">
          <Button
            variant="warning"
            onClick={() => this.props.pageShow("orders", this.props.roomData)}
            size="sm"
          >
            <i className="fas fa-arrow-left" /> <b> Буцах</b>
          </Button>
          <Button variant="danger" onClick={this.props.onHide} size="sm">
            <i className="fas fa-times" /> <b> Хаах</b>
          </Button>
          {uldegdel !== 0 ? (
            <Button
              variant="success"
              onClick={this.updateData}
              size="sm"
              disabled={this.props.lastShift}
            >
              <i className="fas fa-check" /> <b> Хадгалах</b>
            </Button>
          ) : null}
        </Modal.Footer>
      </Modal>
    );
  }
}
