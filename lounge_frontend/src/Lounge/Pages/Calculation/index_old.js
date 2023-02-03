import React, { Component } from "react";
import { store } from "react-notifications-component";
import { InputGroup, FormControl } from "react-bootstrap";
import Moment from "moment";
import Select from "react-select";
import { getUserId, getUser } from "../../../Main/Utils/Auth";
import Keyboard from "./Components/Keyboard";
import IdleTimer from "react-idle-timer";

import MoneyTransfers from "./Components/Modals/MoneyTransfers";
import ProductBalances from "./Components/Modals/ProductBalances";

export default class Calculations extends Component {
  constructor(props) {
    super(props);
    this.state = {
      categories: [],
      products: [],
      clients: [],
      divisions: [],
      orders: [],
      order_detials: [],
      order_payments: [],
      orderingList: [],
      shiftWorker: null,
      sel_parent_cat: null,
      sel_cat: null,
      show_tables: true,
      show_orders: false,
      show_order: false,
      show_payment: false,
      show_detial: false,
      show_customer: false,
      detial_index: null,
      table_id: null,
      table_number: null,
      order_id: null,
      order_amount: null,
      division_id: null,
      keyboardBoxShow: false,
      paymentBoxShow: false,
      user_id: getUserId(),
      workersData: [],
      customer_mobile: "",
      worker_id: null,
      order_information: null,
      session_secund: 60,
      show_menu: false,

      show_money_transfer_modal: false,
      show_product_balances_modal: false,
    };
    this.set_parent_cat = this.set_parent_cat.bind(this);
    this.set_cat = this.set_cat.bind(this);
    this.product_minus = this.product_minus.bind(this);
    this.product_plus = this.product_plus.bind(this);
    this.changeDiscount = this.changeDiscount.bind(this);
    this.toggle_paymentBox = this.toggle_paymentBox.bind(this);
    this.toggle_keyboardBox = this.toggle_keyboardBox.bind(this);
    this.workerChanger = this.workerChanger.bind(this);
    this.customerChanger = this.customerChanger.bind(this);
    this.set_customer_order = this.set_customer_order.bind(this);
    this.set_worker_order = this.set_worker_order.bind(this);

    this.idleTimer = null;
    this.handleOnAction = this.handleOnAction.bind(this);
    this.handleOnActive = this.handleOnActive.bind(this);
    this.handleOnIdle = this.handleOnIdle.bind(this);
    this.showMenu = this.showMenu.bind(this);

    this.modalShow = this.modalShow.bind(this);

    this.shift_work_close = this.shift_work_close.bind(this);
    this.shift_work_open = this.shift_work_open.bind(this);
  }

  async getWorkersData() {
    await fetch("http://" + this.props.ip_address + "/api/users/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then((response) => response.json())
      .then(async (workersList) => {
        await this.setState({ workersData: workersList });
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Үйлчилүүлэгчдийн мэдээллийг сервер чадсангүй. Системийн инженерт хандаж хэлнэ үү. " +
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

  async getCategoriesData() {
    fetch(
      "http://" + this.props.ip_address + "/api/lounge/productCategories/",
      {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
      }
    )
      .then(async (response) => {
        const data = await response.json();
        this.setState({
          categories: data,
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

  async getLastShiftWorker() {
    fetch("http://" + this.props.ip_address + "/api/lounge/LastShiftWorks/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({
          shiftWorker: data[0],
          show_menu: false,
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

  async getOrdersData() {
    var addUrl;
    if (this.state.division_id !== null && this.state.table_id !== null) {
      addUrl =
        "?division=" +
        this.state.division_id +
        "&client=" +
        this.state.table_id;
    } else if (
      this.state.division_id !== null &&
      this.state.table_id === null
    ) {
      addUrl = "?division=" + this.state.division_id;
    } else if (
      this.state.division_id === null &&
      this.state.table_id === null
    ) {
      addUrl = "";
    }
    var url =
      "http://" + this.props.ip_address + "/api/lounge/orders/" + addUrl;
    fetch(url, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({
          orders: data,
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

  async getOrderDetialsData() {
    if (this.state.order_id) {
      fetch(
        "http://" +
          this.props.ip_address +
          "/api/lounge/orderDetials/?order=" +
          this.state.order_id,
        {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Authorization: "Token " + this.props.token,
          },
        }
      )
        .then(async (response) => {
          const data = await response.json();
          this.setState({
            order_detials: data,
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
    } else {
      fetch("http://" + this.props.ip_address + "/api/lounge/orderDetials/", {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
      })
        .then(async (response) => {
          const data = await response.json();
          this.setState({
            order_detials: data,
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
  }

  async getOrderPaymentsData() {
    if (this.state.order_id) {
      fetch(
        "http://" +
          this.props.ip_address +
          "/api/lounge/orderPayments/?orders=" +
          this.state.order_id,
        {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Authorization: "Token " + this.props.token,
          },
        }
      )
        .then(async (response) => {
          const data = await response.json();
          await this.setState({
            order_payments: data,
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
    } else {
      fetch("http://" + this.props.ip_address + "/api/lounge/orderDetials/", {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
      })
        .then(async (response) => {
          const data = await response.json();
          await this.setState({
            order_payments: data,
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
  }

  async getDivisionsData() {
    fetch("http://" + this.props.ip_address + "/api/lounge/divisions/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({
          divisions: data,
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

  async getClientsData() {
    fetch(
      "http://" +
        this.props.ip_address +
        "/api/lounge/clients/?division=" +
        this.state.division_id,
      {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
      }
    )
      .then(async (response) => {
        const data = await response.json();
        this.setState({
          clients: data,
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

  async getProductsData() {
    var url;
    if (this.state.sel_parent_cat == null && this.state.sel_cat == null) {
      fetch("http://" + this.props.ip_address + "/api/lounge/products/", {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
      })
        .then(async (response) => {
          const data = await response.json();
          this.setState({
            products: data,
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
    } else {
      if (this.state.sel_parent_cat != null && this.state.sel_cat == null) {
        url =
          "http://" +
          this.props.ip_address +
          "/api/lounge/products/?categories=" +
          this.state.sel_parent_cat.toString();
        fetch(url, {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Authorization: "Token " + this.props.token,
          },
        })
          .then(async (response) => {
            const data = await response.json();
            this.setState({
              products: data,
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
      if (this.state.sel_cat != null) {
        url =
          "http://" +
          this.props.ip_address +
          "/api/lounge/products/?categories=" +
          this.state.sel_cat.toString();
        fetch(url, {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Authorization: "Token " + this.props.token,
          },
        })
          .then(async (response) => {
            const data = await response.json();
            this.setState({
              products: data,
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
    }
  }

  async set_parent_cat(e) {
    await this.setState({
      sel_parent_cat: e,
      sel_cat: null,
    });
    await this.getProductsData();
  }

  async set_cat(e) {
    await this.setState({
      sel_cat: e,
    });
    await this.getProductsData();
  }

  async show_tables() {
    await this.setState({
      show_tables: true,
      show_order: false,
      show_orders: false,
      show_payment: false,
      show_detial: false,
      keyboardBoxShow: false,
      paymentBoxShow: false,
      show_customer: false,
      order_information: null,
    });
  }

  async show_orders() {
    await this.setState({
      show_tables: false,
      show_order: false,
      show_orders: true,
      show_payment: false,
      show_detial: false,
      keyboardBoxShow: false,
      paymentBoxShow: false,
      show_customer: false,
      order_information: null,
      order_id: null,
      order_detials: [],
    });
    this.getOrdersData();
  }

  async show_order() {
    await this.setState({
      show_tables: false,
      show_order: true,
      show_orders: false,
      show_payment: false,
      show_detial: false,
      show_customer: false,
      keyboardBoxShow: false,
      paymentBoxShow: true,
      customer_mobile: null,
    });
  }

  async show_payment() {
    await this.setState({
      show_tables: false,
      show_order: false,
      show_orders: false,
      show_payment: true,
      show_detial: false,
      show_customer: false,
      order_information: null,
    });
  }

  async show_detial(index) {
    await this.setState({
      show_tables: false,
      show_order: false,
      show_orders: false,
      show_payment: false,
      show_detial: true,
      detial_index: index,
      show_customer: false,
    });
  }

  async set_division(id, name) {
    await this.setState({
      division_id: id,
      division_name: name,
      table_id: null,
      table_number: null,
      order_id: null,
      order_detials: [],
    });
    this.getClientsData();
  }

  async set_table(id, number) {
    await this.setState({
      table_id: id,
      table_number: number,
      order_id: null,
      show_tables: false,
      show_orders: true,
      show_order: false,
      order_detials: [],
    });
    this.getOrdersData();
  }

  async set_order(id, amount) {
    this.set_order_information(id);
    await this.setState({
      order_id: id,
      order_amount: amount,
      show_orders: false,
      show_tables: false,
      show_order: true,
      keyboardBoxShow: false,
      paymentBoxShow: true,
    });
    this.getOrderDetialsData();
    this.getOrderPaymentsData();
  }

  async product_minus(id, name, cost) {
    const index = await this.getIndex(id);
    if (index !== -1) {
      await this.setState((prevState) => {
        const newItems = [...prevState.orderingList];
        if (prevState.orderingList[index].quantity > 1) {
          newItems[index].quantity = prevState.orderingList[index].quantity - 1;
          newItems[index].subtotal =
            (prevState.orderingList[index].quantity - 1) *
            prevState.orderingList[index].cost;
        } else {
          newItems.splice(index, 1);
        }
        return { orderingList: newItems };
      });
    }
  }

  getIndex(value) {
    for (var i = 0; i < this.state.orderingList.length; i++) {
      if (this.state.orderingList[i]["id"] === value) {
        return i;
      }
    }
    return -1; //to handle the case where the value doesn't exist
  }

  async product_plus(id, name, cost) {
    const index = await this.getIndex(id);
    if (index === -1) {
      await this.setState({
        orderingList: [
          ...this.state.orderingList,
          {
            id: id,
            name: name,
            cost: cost,
            quantity: 1,
            subtotal: cost,
            discount_rate: 0,
          },
        ],
      });
    } else {
      await this.setState((prevState) => {
        const newItems = [...prevState.orderingList];
        newItems[index].quantity = prevState.orderingList[index].quantity + 1;
        newItems[index].subtotal =
          prevState.orderingList[index].quantity * cost;
        return { orderingList: newItems };
      });
    }
  }

  UNSAFE_componentWillMount() {
    this.getCategoriesData();
    this.getProductsData();
    this.getDivisionsData();
    this.getLastShiftWorker();
    this.getWorkersData();
  }

  checkingInOrder(id) {
    return this.state.orderingList.some(function (el) {
      return el.id === id;
    });
  }

  async modalHide() {
    await this.setState({
      show_money_transfer_modal: false,
      show_product_balances_modal: false,
    });
  }

  async modalShow(value) {
    if (value === "moneyTransfers") {
      await this.setState({
        show_money_transfer_modal: true,
        show_menu: false,
      });
    }
    if (value === "productBalances") {
      await this.setState({
        show_product_balances_modal: true,
        show_menu: false,
      });
    }
  }

  async show_customer() {
    await this.setState({
      show_customer: true,
      show_orders: false,
      show_tables: false,
      show_order: false,
      show_payment: false,
      paymentBoxShow: true,
      keyboardBoxShow: true,
    });
  }

  async clearButton() {
    await this.setState({
      orderingList: [],
    });
  }

  async doOrderButton() {
    if (
      this.state.division_id &&
      this.state.table_id &&
      !this.state.order_id &&
      !this.state.shiftWorker.finished
    ) {
      var orderAmount = 0;
      this.state.orderingList.map((detail) => {
        orderAmount = orderAmount + parseInt(detail.subtotal);
        return null;
      });
      var orderObj = {
        amount: orderAmount,
        is_now: true,
        status: "Төлбөр төлөгдөөгүй.",
        client: this.state.table_id,
        division: this.state.division_id,
        created_by: this.state.user_id,
        required_date: new Date(),
        shift_work: this.state.shiftWorker.id,
      };
      let status;
      const url = "http://" + this.props.ip_address + "/api/lounge/postOrder/";
      var response = await fetch(url, {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
        withCredentials: true,
        body: JSON.stringify(orderObj),
      })
        .then((results) => {
          status = results.ok;
          return results;
        })
        .then((results) => {
          results = results.json();
          return results;
        });

      var haveError = false;
      if (status) {
        var order = response["id"];
        this.state.orderingList.map(async (detail) => {
          var detailObj = {
            quantity: detail.quantity,
            discount: parseInt(detail.cost) * parseInt(detail.quantity),
            discount_rate: detail.discount_rate,
            subtotal: detail.subtotal,
            is_deleted: false,
            created_by: this.state.user_id,
            client: this.state.table_id,
            fr_client: 19,
            order: order,
            product: detail.id,
            shift_work: this.state.shiftWorker.id,
          };
          const url =
            "http://" + this.props.ip_address + "/api/lounge/postOrderDetail/";
          var detailResponse = await fetch(url, {
            method: "POST",
            headers: {
              Accept: "application/json",
              "Content-Type": "application/json",
              Authorization: "Token " + this.props.token,
            },
            withCredentials: true,
            body: JSON.stringify(detailObj),
          }).then((results) => {
            return results;
          });
          if (detailResponse.ok) {
            store.addNotification({
              title: "Захиалга амжилттай!",
              message: "Захиалгын detail амжилттай үүслээ.",
              type: "success",
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
            haveError = true;
            store.addNotification({
              title: "Анхаар!",
              message:
                "Захиалгын detail үүссэнгүй. Системийн инженерт хандана уу.",
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
        });
      } else {
        store.addNotification({
          title: "Анхаар!",
          message: "Захиалга үүссэнгүй. Системийн инженерт хандана уу.",
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
      if (!haveError) {
        this.set_order_information(order);
        await this.setState({
          order_id: order,
          orderingList: [],
        });
      }
      this.getOrderDetialsData();
    } else {
      if (!this.state.division_id || !this.state.table_id) {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Client-ээ сонгоно уу! (ширээний дугаар, өрөөний дугаарыг сонгох шаардлагатай!))",
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
      } else if (this.state.shiftWorker.finished) {
        store.addNotification({
          title: "Анхаар!",
          message: "Ээлж нээгээгүй байгаа тул захиалга авч болохгүй!",
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
      } else {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Захиалгын мэдээлэл илгээхэд алдаа гарлаа. Системийн инженерт хандана уу.",
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
    }
  }

  async updateOrderButton() {
    if (
      this.state.division_id &&
      this.state.table_id &&
      this.state.order_id &&
      !this.state.shiftWorker.finished
    ) {
      var getOrderStatus = false;
      var url =
        "http://" +
        this.props.ip_address +
        "/api/lounge/postOrder/" +
        this.state.order_id.toString() +
        "/";

      var orderData = await fetch(url, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
      })
        .then((results) => {
          getOrderStatus = results.ok;
          return results;
        })
        .then((results) => results.json())
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
      if (getOrderStatus) {
        orderData.amount = parseInt(orderData.amount);
        this.state.orderingList.map((detail) => {
          orderData.amount = orderData.amount + parseInt(detail.subtotal);
          return null;
        });
        if (orderData.status === "Төлбөр гүйцэт төлсөн.") {
          orderData.status = "Төлбөр дутуу төлсөн.";
        }
        orderData.updated_by = this.state.user_id;
        orderData.updated_at = new Date();

        var url2 =
          "http://" +
          this.props.ip_address +
          "/api/lounge/postOrder/" +
          this.state.order_id.toString() +
          "/";

        var response = await fetch(url2, {
          method: "PUT",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
            Authorization: "Token " + this.props.token,
          },
          withCredentials: true,
          body: JSON.stringify(orderData),
        })
          .then((results) => {
            return results;
          })
          .then((results) => {
            return results;
          });
        var haveError = false;
        if (response.ok) {
          this.state.orderingList.map(async (detail) => {
            var detailObj = {
              quantity: detail.quantity,
              discount: parseInt(detail.cost) * parseInt(detail.quantity),
              discount_rate: detail.discount_rate,
              subtotal: detail.subtotal,
              is_deleted: false,
              created_by: this.state.user_id,
              client: this.state.table_id,
              fr_client: 19,
              order: this.state.order_id,
              product: detail.id,
              shift_work: this.state.shiftWorker.id,
            };
            const url =
              "http://" +
              this.props.ip_address +
              "/api/lounge/postOrderDetail/";
            var detailResponse = await fetch(url, {
              method: "POST",
              redirect: "follow",
              headers: {
                Accept: "application/json",
                "Content-Type": "application/json",
                Authorization: "Token " + this.props.token,
              },
              withCredentials: true,
              body: JSON.stringify(detailObj),
            }).then((results) => {
              return results;
            });

            if (detailResponse.ok) {
              store.addNotification({
                title: "Захиалга амжилттай!",
                message: "Захиалгын detail амжилттай үүслээ.",
                type: "success",
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
              haveError = true;
              store.addNotification({
                title: "Анхаар!",
                message:
                  "Захиалгын detail үүссэнгүй. Системийн инженерт хандана уу.",
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
            if (!haveError) {
              await this.setState({
                orderingList: [],
              });
            }
            this.getOrderDetialsData();
          });
        } else {
          store.addNotification({
            title: "Анхаар!",
            message: "Захиалга үүссэнгүй. Системийн инженерт хандана уу.",
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
      }
    } else {
      if (this.state.shiftWorker.finished) {
        store.addNotification({
          title: "Анхаар!",
          message: "Ээлж нээгээгүй байгаа тул захиалга авч болохгүй!",
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
      } else {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Захиалгын мэдээлэл шинэчлэхэд алдаа гарлаа. Системийн инженерт хандана уу.",
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
    }
  }

  async changeDiscount(e) {
    e.persist();
    if (e.target.name === "discounted-price") {
      await this.setState((prevState) => {
        const newItems = [...prevState.orderingList];
        newItems[this.state.detial_index].subtotal = parseInt(e.target.value);
        newItems[this.state.detial_index].discount_rate =
          (1 -
            parseInt(e.target.value) /
              (prevState.orderingList[this.state.detial_index].cost *
                prevState.orderingList[this.state.detial_index].quantity)) *
          100;
        return { orderingList: newItems };
      });
    }
  }

  toggle_paymentBox() {
    this.setState({ paymentBoxShow: !this.state.paymentBoxShow });
  }

  toggle_keyboardBox() {
    this.setState({ keyboardBoxShow: !this.state.keyboardBoxShow });
  }

  paymentInfoReceiver(status) {
    if (status) {
      this.getOrdersData();
      this.getOrderDetialsData();
      this.getOrderPaymentsData();
      this.setState({
        paymentBoxShow: true,
      });
    }
  }

  async workerChanger(e) {
    await this.setState({
      worker_id: e.id,
    });
  }

  async customerChanger(e, type) {
    if (type === "number") {
      if (this.state.customer_mobile.length < 8) {
        await this.setState((prevState) => ({
          customer_mobile: prevState.customer_mobile + e.toString(),
        }));
      }
    } else {
      e.persist();
      await this.setState({
        customer_mobile: e.target.value,
      });
    }
  }

  set_customer_order() {
    if (
      this.state.order_id !== null &&
      this.state.customer_mobile.length === 8
    ) {
      var orderObj = {
        order_id: this.state.order_id,
        worker_id: null,
        customer_mobile: parseInt(this.state.customer_mobile),
      };

      var url =
        "http://" +
        this.props.ip_address +
        "/api/lounge/orderUpdate/" +
        this.state.order_id +
        "/";
      fetch(url, {
        method: "PATCH",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
        withCredentials: true,
        body: JSON.stringify(orderObj),
      })
        .then((result) => result.json())
        .then((result) => {
          this.setState({
            order_information: result,
          });
          return result;
        });
    } else {
      if (!this.state.order_id) {
        store.addNotification({
          title: "Анхаар!",
          message: "Захиалгаа (Order) сонгоно уу!.",
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
      if (!this.state.customer_mobile) {
        store.addNotification({
          title: "Анхаар!",
          message: "Үйлчлүүлэгчийн утасны дугаарыг оруулаагүй байна!.",
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
    }
  }

  set_worker_order() {
    if (
      (this.state.order_id !== null && this.state.worker_id !== null) ||
      (this.state.order_id !== null && this.state.customer_mobile !== null)
    ) {
      var orderObj = {
        order_id: this.state.order_id,
        worker_id: this.state.worker_id,
        customer_mobile: null,
      };

      var url =
        "http://" +
        this.props.ip_address +
        "/api/lounge/orderUpdate/" +
        this.state.order_id +
        "/";
      fetch(url, {
        method: "PATCH",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
        withCredentials: true,
        body: JSON.stringify(orderObj),
      })
        .then((result) => result.json())
        .then((result) => {
          this.setState({
            order_information: result,
          });
          return result;
        });
    } else {
      if (!this.state.order_id) {
        store.addNotification({
          title: "Анхаар!",
          message: "Захиалгаа (Order) сонгоно уу!.",
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
      if (!this.state.worker_id) {
        store.addNotification({
          title: "Анхаар!",
          message: "Ажилчны нэрийг оруулаагүй байна!.",
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
    }
  }

  set_order_information(id) {
    var url =
      "http://" + this.props.ip_address + "/api/lounge/orderUpdate/" + id + "/";
    fetch(url, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    }).then(async (response) => {
      const data = await response.json();
      console.log(data);
      await this.setState({
        order_information: data,
        division_id: data["division"],
        table_id: data["client"].id,
        table_number: data["client"].number,
        division_name: data["client"].division.name,
      });
    });
  }

  handleOnAction(event) {
    //console.log("user did something", event);
  }

  handleOnActive(event) {
    //console.log("time remaining", this.idleTimer.getRemainingTime());
  }

  handleOnIdle(event) {
    this.props.signOut();
  }

  showMenu() {
    this.setState({ show_menu: !this.state.show_menu });
  }

  async shift_work_open() {
    console.log(this.props.token);
    var orderObj = {
      worker: getUserId(),
      finished: false,
      worker_confirm: true,
      controller_confirm: false,
      created_by: getUserId(),
      created_at: new Date(),
      division: 5,
    };
    const url =
      "http://" + this.props.ip_address + "/api/lounge/shiftWorkUpdate/";
    await fetch(url, {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
      withCredentials: true,
      body: JSON.stringify(orderObj),
    }).then((results) => {
      console.log(results.json());
      if (results.ok) {
        store.addNotification({
          title: "Амжилттай!",
          message: "Ээлжийг амжилттай нээлээ.",
          type: "success",
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
        store.addNotification({
          title: "Амжилтгүй!",
          message: "Ээлжийг нээж чадсангүй. Системийн инженерт хандана уу.",
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
      return results;
    });
    this.getLastShiftWorker();
  }

  async shift_work_close() {
    if (this.state.shiftWorker.worker.id === getUserId()) {
      var orderObj = {
        finished: true,
      };
      const url =
        "http://" +
        this.props.ip_address +
        "/api/lounge/shiftWorkUpdate/" +
        this.state.shiftWorker.id.toString() +
        "/";
      await fetch(url, {
        method: "PATCH",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
        withCredentials: true,
        body: JSON.stringify(orderObj),
      }).then((results) => {
        if (results.ok) {
          store.addNotification({
            title: "Амжилттай!",
            message: "Ээлжийг амжилттай хаалаа.",
            type: "success",
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
          store.addNotification({
            title: "Амжилтгүй!",
            message: "Ээлжийг хааж чадсангүй. Системийн инженерт хандана уу.",
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
        return results;
      });
      this.getLastShiftWorker();
    }
  }

  render() {
    var orderedTotalAmount = 0;
    var orderingTotalAmount = 0;
    var paymentTotalAmount = 0;
    this.state.order_detials.map(
      (detial) =>
        (orderedTotalAmount =
          parseInt(orderedTotalAmount) + parseInt(detial.subtotal))
    );
    this.state.orderingList.map(
      (ordering) =>
        (orderingTotalAmount =
          parseInt(orderingTotalAmount) + parseInt(ordering.subtotal))
    );
    this.state.order_payments.map(
      (payment) =>
        (paymentTotalAmount =
          parseInt(paymentTotalAmount) + parseInt(payment.amount))
    );
    var lounge_box_body;
    if (!this.state.show_order && !this.state.keyboardBoxShow) {
      lounge_box_body = "lounge-box-body-noButton-noKeyboard";
    } else if (this.state.show_order && !this.state.keyboardBoxShow) {
      lounge_box_body = "lounge-box-body-Button-noKeyboard";
    } else if (
      !this.state.show_order &&
      this.state.keyboardBoxShow &&
      !this.state.show_customer
    ) {
      lounge_box_body = "lounge-box-body-noButton-Keyboard";
    } else if (
      !this.state.show_order &&
      this.state.keyboardBoxShow &&
      this.state.show_customer
    ) {
      lounge_box_body = "lounge-box-body-noButton-Keyboard-Customer";
    } else if (this.state.show_order && this.state.keyboardBoxShow) {
      lounge_box_body = "lounge-box-body-Button-Keyboard";
    }
    return (
      <div className="row pt-0 p-0 m-0 loungeContainer">
        <IdleTimer
          ref={(ref) => {
            this.idleTimer = ref;
          }}
          timeout={1000 * 60 * 10}
          onActive={this.handleOnActive}
          onIdle={this.handleOnIdle}
          onAction={this.handleOnAction}
          debounce={250}
          capture={true}
        />
        <div className="col-md-12 loungeHeader">
          <div className="brand">
            <img src="/lounge_app_logo.png" alt="Tesoro Lounge Logo" />
          </div>
          {this.state.show_menu ? (
            <div className="menuBox">
              <button
                className="item"
                onClick={() => this.modalShow("moneyTransfers")}
              >
                <i className="fa fa-file-text-o" aria-hidden="true"></i>{" "}
                Гүйлгээний жагсаалт
              </button>
              <div className="item">
                <i className="fa fa-file-text-o" aria-hidden="true"></i> Барааны
                үлдэгдэл
              </div>
              <div className="item">
                <i className="fa fa-file-text-o" aria-hidden="true"></i>{" "}
                Материалын үлдэгдэл
              </div>
              <div className="item">
                <i className="fa fa-file-text-o" aria-hidden="true"></i> Орлогын
                тайлан
              </div>
              <div className="item">
                <i className="fa fa-file-text-o" aria-hidden="true"></i>{" "}
                Зарлагын тайлан
              </div>
              {this.state.shiftWorker && this.state.shiftWorker.finished ? (
                <button className="item" onClick={this.shift_work_open}>
                  <i className="fa fa-file-text-o" aria-hidden="true"></i> Ээлж
                  нээх
                </button>
              ) : null}
              {this.state.shiftWorker &&
              !this.state.shiftWorker.finished &&
              this.state.shiftWorker.worker.id === getUserId() ? (
                <button className="item" onClick={this.shift_work_close}>
                  <i className="fa fa-file-text-o" aria-hidden="true"></i> Ээлж
                  хаах
                </button>
              ) : null}
            </div>
          ) : null}
          <div className="center">
            <div className="barmen">
              <i className="fa fa-user" aria-hidden="true"></i>
              <div className="info">
                <div className="title">Бартендер:</div>
                <div className="name">
                  {this.state.shiftWorker && !this.state.shiftWorker.finished
                    ? this.state.shiftWorker.worker.username
                    : "Ээлж нээгээгүй!"}
                </div>
              </div>
            </div>
            <div className="waiter">
              <i className="fa fa-user" aria-hidden="true"></i>
              <div className="info">
                <div className="title">Зөөгч:</div>
                <div className="name">{getUser()}</div>
              </div>
            </div>
          </div>
          <div className="logout">
            <button
              type="button"
              className="btn rounded-0 menu"
              onClick={this.showMenu}
              style={
                this.state.show_menu
                  ? { background: "#e8e7e7", color: "#212529" }
                  : {}
              }
            >
              <i className="fa fa-bars" aria-hidden="true"></i>
            </button>
            <button
              type="button"
              className="btn btn-danger rounded-0"
              onClick={this.props.signOut}
            >
              <i className="fa fa-sign-out" aria-hidden="true"></i>
            </button>
          </div>
        </div>
        <div className="col-md-4 loungeBodyLeft">
          <div className="card">
            <div className="card-body p-1">
              <div className="row p-0 m-0 lounge-left-side">
                <div className="col-md-12 border-bottom pb-1 p-0 button-side topTypeMenu">
                  <button
                    type="button"
                    className={
                      this.state.show_tables
                        ? "btn btn-primary tables rounded-0"
                        : "btn btn-secondary tables rounded-0"
                    }
                    onClick={() => this.show_tables()}
                  >
                    Clients
                  </button>
                  <button
                    type="button"
                    className={
                      this.state.show_orders
                        ? "btn btn-primary orders rounded-0"
                        : "btn btn-secondary orders rounded-0"
                    }
                    onClick={() => this.show_orders()}
                  >
                    Orders
                  </button>
                  <button
                    type="button"
                    className={
                      this.state.show_order
                        ? "btn btn-primary order rounded-0"
                        : "btn btn-secondary order rounded-0"
                    }
                    onClick={() => this.show_order()}
                  >
                    Details
                    <div className="orderingCounter">
                      <div className="orderingCounterNumber">
                        {this.state.orderingList.length}
                      </div>
                    </div>
                  </button>
                  <button
                    type="button"
                    className={
                      this.state.show_payment
                        ? "btn btn-primary payment rounded-0"
                        : "btn btn-secondary payment rounded-0"
                    }
                    onClick={() => this.show_payment()}
                  >
                    Payments
                  </button>
                </div>
                <div
                  className={
                    this.state.keyboardBoxShow
                      ? "col-md-12 border-bottom p-0 m-0 body-side"
                      : "col-md-12 border-bottom p-0 m-0 body-side-full"
                  }
                >
                  <div className="lounge-box-header mb-1">
                    <div className="d-inline-block division">
                      <i className="fa fa-home" /> : {this.state.division_name}
                    </div>
                    <div className="d-inline-block table">
                      <i className="fas fa-map-marker-alt" /> :{" "}
                      {this.state.table_number}
                    </div>
                    <div className="d-inline-block order">
                      <i className="fas fa-file-invoice" /> :{" "}
                      {this.state.order_id}
                    </div>
                  </div>

                  <div className={lounge_box_body}>
                    {
                      /* Show Divisions */
                      this.state.show_tables === true
                        ? this.state.divisions.map((division, index) => {
                            if (this.state.division_id != null) {
                              if (this.state.division_id === division.id) {
                                return (
                                  <button
                                    key={index}
                                    type="button"
                                    className="btn btn-success tables rounded-0 w-25"
                                    onClick={() =>
                                      this.set_division(
                                        division.id,
                                        division.name.substring(0, 2)
                                      )
                                    }
                                  >
                                    {division.name.slice(0, 3)}
                                  </button>
                                );
                              } else {
                                return (
                                  <button
                                    key={index}
                                    type="button"
                                    className="btn btn-secondary tables rounded-0 w-25"
                                    onClick={() =>
                                      this.set_division(
                                        division.id,
                                        division.name
                                      )
                                    }
                                  >
                                    {division.name.slice(0, 3)}
                                  </button>
                                );
                              }
                            } else {
                              return (
                                <button
                                  key={index}
                                  type="button"
                                  className="btn btn-secondary tables rounded-0 w-25"
                                  onClick={() =>
                                    this.set_division(
                                      division.id,
                                      division.name
                                    )
                                  }
                                >
                                  {division.name.slice(0, 3)}
                                </button>
                              );
                            }
                          })
                        : null
                    }
                    {
                      /* Show Clients */
                      this.state.show_tables === true && this.state.division_id
                        ? this.state.clients.map((client, index) => {
                            if (
                              this.state.table_id &&
                              this.state.table_id === client.id
                            ) {
                              return (
                                <button
                                  className="btn btn-primary-outline m-0 p-0"
                                  key={index}
                                  onClick={() =>
                                    this.set_table(client.id, client.number)
                                  }
                                >
                                  <div
                                    key={index}
                                    className="table-circle d-inline-block mt-2 ml-2 bg-success"
                                  >
                                    <span>{client.number}</span>
                                  </div>
                                </button>
                              );
                            } else {
                              return (
                                <button
                                  className="btn btn-primary-outline m-0 p-0"
                                  key={index}
                                  onClick={() =>
                                    this.set_table(client.id, client.number)
                                  }
                                >
                                  <div
                                    key={index}
                                    className="table-circle d-inline-block mt-2 ml-2 bg-secondary"
                                  >
                                    <span>{client.number}</span>
                                  </div>
                                </button>
                              );
                            }
                          })
                        : null
                    }
                    {
                      /* Show Orders */
                      this.state.show_orders === true
                        ? this.state.orders.map((order, index) => {
                            return (
                              <button
                                className="btn btn-primary-outline m-0 p-0 orderList"
                                key={index}
                                onClick={() =>
                                  this.set_order(order.id, order.amount)
                                }
                              >
                                <div
                                  key={index}
                                  className="w-100 pl-1 pr-1 dasd"
                                >
                                  <div className="date">
                                    {Moment(order.created_at).format(
                                      "Do, H:mm"
                                    )}
                                  </div>
                                  <div className="info">{order.amount}</div>
                                  <div
                                    className={(() => {
                                      switch (order.status) {
                                        case "Төлбөр гүйцэт төлсөн.":
                                          return "status green";
                                        case "Төлбөр илүү төлсөн.":
                                          return "status green";
                                        case "Төлбөр төлөгдөөгүй.":
                                          return "status red";
                                        default:
                                          return "status yellow";
                                      }
                                    })()}
                                  >
                                    <i className="fas fa-dot-circle"></i>
                                  </div>
                                </div>
                              </button>
                            );
                          })
                        : null
                    }
                    {
                      /* Show Order */
                      this.state.show_order === true
                        ? this.state.order_detials.map((detial, index) => {
                            return (
                              <button
                                className="btn btn-primary-outline m-0 p-0 orderList"
                                key={index}
                                // onClick={() => this.show_detial(index)}
                              >
                                <div
                                  key={index}
                                  className="w-100 pl-1 pr-1 dasd"
                                >
                                  <div className="date2">
                                    {Moment(detial.created_at).format("H:mm")}
                                  </div>
                                  <div className="info2">
                                    <div className="name">
                                      {detial.product.name}
                                    </div>
                                    <div className="quantity">
                                      x {detial.quantity}
                                    </div>
                                    <div className="subtotal">
                                      {detial.subtotal}₮
                                    </div>
                                  </div>
                                </div>
                              </button>
                            );
                          })
                        : null
                    }
                    {
                      /* Show OrderingList */
                      this.state.orderingList && this.state.show_order
                        ? this.state.orderingList.map((detial, index) => {
                            return (
                              <button
                                className="btn btn-primary-outline m-0 p-0 orderList orderingList"
                                key={index}
                                onClick={() => this.show_detial(index)}
                              >
                                <div
                                  key={index}
                                  className="w-100 pl-1 pr-1 dasd"
                                >
                                  <div className="date2">
                                    {Moment(detial.created_at).format("H:mm")}
                                  </div>
                                  <div className="info2">
                                    <div className="name">{detial.name}</div>
                                    <div className="quantity">
                                      x {detial.quantity}
                                    </div>
                                    <div className="subtotal">
                                      {detial.subtotal}₮
                                    </div>
                                  </div>
                                </div>
                              </button>
                            );
                          })
                        : null
                    }
                    {
                      /* Show detial box */
                      this.state.detial_index !== null &&
                      this.state.show_detial ? (
                        <div className="detial_info">
                          <div className="info">
                            <p className="name">
                              {
                                this.state.orderingList[this.state.detial_index]
                                  .name
                              }{" "}
                              x{" "}
                              <strong>
                                {
                                  this.state.orderingList[
                                    this.state.detial_index
                                  ].quantity
                                }
                                ш
                              </strong>
                            </p>
                            <p className="total">
                              {
                                this.state.orderingList[this.state.detial_index]
                                  .subtotal
                              }
                              ₮
                            </p>
                          </div>
                          <div className="discount-price">
                            <p className="sentence">
                              Хөнгөлөх дүнгээ бичнэ үү.
                            </p>
                            <InputGroup size="sm">
                              <FormControl
                                aria-label="Small"
                                aria-describedby="inputGroup-sizing-sm"
                                name="discounted-price"
                                defaultValue={
                                  this.state.orderingList[
                                    this.state.detial_index
                                  ].subtotal
                                }
                                onChange={(e) => this.changeDiscount(e)}
                              />
                            </InputGroup>
                            <p className="sentence">
                              Хөнгөлөгдөж байгаа хувь:{" "}
                              {
                                this.state.orderingList[this.state.detial_index]
                                  .discount_rate
                              }
                            </p>
                          </div>
                          <button
                            className="btn btn-primary-outline m-0 p-0"
                            onClick={() => this.show_order()}
                          >
                            <div className="backButton dot">
                              <i
                                className="fa fa-arrow-left"
                                aria-hidden="true"
                              ></i>
                            </div>
                          </button>
                        </div>
                      ) : null
                    }
                    {
                      /* Customer box */
                      this.state.show_customer ? (
                        <div className="customer_info">
                          <div className="customer">
                            <div className="text">
                              Захиалга өгсөн үйлчлүүлэгчийн утасны дугаарыг
                              бичих хэсэг.
                            </div>
                            <input
                              type="text"
                              className="customerInput"
                              name="customer"
                              value={this.state.customer_mobile}
                              onChange={(e) => this.customerChanger(e, "input")}
                              placeholder="Утасны дугаар ..."
                              maxLength="8"
                            />
                            <button
                              disabled={
                                this.state.customer_mobile !== null &&
                                this.state.customer_mobile.length === 8
                                  ? false
                                  : true
                              }
                              onClick={this.set_customer_order}
                            >
                              <i
                                className="fa fa-floppy-o"
                                aria-hidden="true"
                              ></i>
                            </button>
                          </div>
                          <div className="worker">
                            <div className="text">
                              Бүтээгдэхүүн авсан, дутаасан, үрэгдүүлсэн ажилтны
                              нэрийг сонгоно.
                            </div>
                            <Select
                              className="basic-single workerSelector"
                              classNamePrefix="select"
                              defaultValue=""
                              isClearable="true"
                              isSearchable="true"
                              name="worker_id"
                              onChange={this.workerChanger}
                              getOptionLabel={(option) => {
                                return option.first_name;
                              }}
                              getOptionValue={(option) => {
                                return option.id;
                              }}
                              options={this.state.workersData}
                              placeholder="Ажилтаны нэрийг сонгоно уу!"
                            />
                            <button
                              disabled={
                                this.state.worker_id !== null ? false : true
                              }
                              onClick={this.set_worker_order}
                            >
                              <i
                                className="fa fa-floppy-o"
                                aria-hidden="true"
                              ></i>
                            </button>
                          </div>
                          {this.state.order_information ? (
                            <div className="orderInfo">
                              <ul>
                                <li>
                                  Үйлчлүүлэгч:{" "}
                                  {this.state.order_information.customer
                                    ? this.state.order_information.customer
                                        .mobile
                                    : "Бүртгэлтгүй."}
                                </li>
                                <li>
                                  Үйлчлүүлсэн Ажилтан:{" "}
                                  {this.state.order_information.worker
                                    ? this.state.order_information.worker
                                        .first_name
                                    : "Ажилтан биш."}
                                </li>
                                <li>
                                  Дүн: {this.state.order_information.amount}₮
                                </li>
                                <li>
                                  Төлөв: {this.state.order_information.status}
                                </li>
                                <li>
                                  Ширээ:{" "}
                                  {
                                    this.state.order_information.client.division
                                      .name
                                  }{" "}
                                  - {this.state.order_information.client.number}
                                </li>
                                <li>
                                  Үүссэн:{" "}
                                  {Moment(
                                    this.state.order_information.created_at
                                  ).format("Do, H:mm")}
                                </li>
                                <li>
                                  Зассан:{" "}
                                  {Moment(
                                    this.state.order_information.updated_at
                                  ).format("Do, H:mm")}
                                </li>
                              </ul>
                            </div>
                          ) : null}
                          <button
                            className="btn btn-primary-outline m-0 p-0"
                            onClick={() => this.show_order()}
                          >
                            <div className="backButton dot">
                              <i
                                className="fa fa-arrow-left"
                                aria-hidden="true"
                              ></i>
                            </div>
                          </button>
                        </div>
                      ) : null
                    }
                  </div>
                  {this.state.show_order ? (
                    <div className="lounge-box-accountButtons p-0">
                      <button
                        disabled={this.state.order_id !== null ? false : true}
                        type="button"
                        className={
                          this.state.order_id === null
                            ? "btn btn-secondary customerBtn rounded-0 disabled"
                            : "btn btn-secondary customerBtn rounded-0"
                        }
                        onClick={() => this.show_customer()}
                      >
                        <i className="fa fa-user" aria-hidden="true"></i>
                      </button>
                      <button
                        type="button"
                        className={
                          this.state.orderingList.length === 0
                            ? "btn btn-danger clearBtn rounded-0 disabled"
                            : "btn btn-danger clearBtn rounded-0"
                        }
                        onClick={() => this.clearButton()}
                      >
                        <i className="fa fa-trash" aria-hidden="true"></i>
                      </button>
                      <button
                        type="button"
                        className={
                          this.state.orderingList.length === 0
                            ? "btn btn-success doOrderBtn rounded-0 disabled"
                            : "btn btn-success doOrderBtn rounded-0"
                        }
                        onClick={
                          this.state.orderingList.length !== 0
                            ? () => {
                                if (this.state.order_id) {
                                  this.updateOrderButton();
                                } else {
                                  this.doOrderButton();
                                }
                              }
                            : null
                        }
                      >
                        <i className="fa fa-plus" aria-hidden="true"></i>
                      </button>
                    </div>
                  ) : null}
                  {this.state.show_customer ? null : (
                    <div className="lounge-box-footer pl-2 pr-2 p-0">
                      <div className="ordered">
                        <div className="float-left d-inline-block">
                          Захиалсан барааны дүн:
                        </div>
                        <div className="float-right d-inline-block">
                          {orderedTotalAmount}
                        </div>
                      </div>
                      <div className="ordering">
                        <div className="float-left d-inline-block">
                          Захиалж байгаа барааны дүн:
                        </div>
                        <div className="float-right d-inline-block">
                          {orderingTotalAmount}
                        </div>
                      </div>
                      <div className="totalOrder">
                        <div className="float-left d-inline-block">
                          Захиалгын нийт дүн:
                        </div>
                        <div className="float-right d-inline-block">
                          {orderedTotalAmount + orderingTotalAmount}
                        </div>
                      </div>
                      <div className="paid">
                        <div className="float-left d-inline-block">
                          Төлсөн нийт дүн:
                        </div>
                        <div className="float-right d-inline-block">
                          {paymentTotalAmount}
                        </div>
                      </div>
                      <div className="underPaid">
                        <div className="float-left d-inline-block">
                          Төлбөрийн дутуу:
                        </div>
                        <div className="float-right d-inline-block">
                          {orderedTotalAmount +
                            orderingTotalAmount -
                            paymentTotalAmount}
                        </div>
                      </div>
                    </div>
                  )}
                </div>
                {this.state.keyboardBoxShow ? null : (
                  <button
                    className="btn btn-warning order rounded-0 keyboardBoxShow"
                    onClick={() => this.toggle_keyboardBox()}
                  >
                    <i className="fa fa-angle-double-up" aria-hidden="true"></i>
                    <span>KEYBOARD</span>
                    <i className="fa fa-angle-double-up" aria-hidden="true"></i>
                  </button>
                )}
                <div
                  className={
                    this.state.keyboardBoxShow
                      ? "col-md-12 pb-1 calculator-side"
                      : "col-md-12 pb-1 calculator-side-none"
                  }
                >
                  <button
                    className="btn btn-warning order rounded-0"
                    onClick={() => this.toggle_keyboardBox()}
                  >
                    <i
                      className="fa fa-angle-double-down"
                      aria-hidden="true"
                    ></i>
                  </button>
                  <Keyboard
                    order_id={this.state.order_id}
                    shift_worker={this.state.shiftWorker}
                    paymentInfoReceiver={this.paymentInfoReceiver.bind(this)}
                    mobile={this.state.show_customer}
                    passenger={this.customerChanger}
                    {...this.props}
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className="col-md-8 loungeBodyRight">
          <div className="card">
            <div className="card-body p-1">
              <div className="row p-0 m-0 lounge-right-side">
                <div className="col-md-12 border-bottom pb-1 p-0 button-side">
                  {this.state.categories.map((cat, index) => {
                    if (cat.parent === null) {
                      return (
                        <button
                          key={index}
                          type="button"
                          className="btn btn-info rounded-0 mr-1"
                          onClick={() => this.set_parent_cat(cat.id)}
                        >
                          {cat.name}
                        </button>
                      );
                    } else {
                      return null;
                    }
                  })}
                </div>
                <div className="col-md-12 border-bottom pb-1 p-0 body-side overflow-auto">
                  <div className="row m-0 p-0">
                    <div className="col-sm-12 m-0 p-0">
                      {this.state.categories.map((cat, index) => {
                        if (
                          cat.parent !== null &&
                          cat.parent === this.state.sel_parent_cat
                        ) {
                          return (
                            <button
                              key={index}
                              type="button"
                              className="btn btn-info rounded-0 mr-1 mb-1"
                              onClick={() => this.set_cat(cat.id)}
                            >
                              {cat.name}
                            </button>
                          );
                        } else {
                          return null;
                        }
                      })}
                    </div>
                    <div className="col-sm-12 m-0 p-0">
                      {this.state.products.map((product, index) => {
                        return (
                          <div
                            className="d-inline-block pt-2 pl-2 productBox"
                            key={index}
                          >
                            <div className="border rounded box p-1 ">
                              <div className="deed">
                                <div className="image">
                                  {product.image === null ? (
                                    <img
                                      src="/dist/img/no-image.jpg"
                                      className="rounded"
                                      alt={product.name}
                                      width="100%"
                                      height="100%"
                                    />
                                  ) : (
                                    <img
                                      src={product.image}
                                      className="rounded"
                                      alt={product.name}
                                      width="100%"
                                      height="100%"
                                    />
                                  )}
                                </div>
                                <div className="text pt-1">{product.name}</div>
                              </div>

                              {this.checkingInOrder(product.id) ? (
                                <div className="dood">
                                  <button
                                    type="button"
                                    className="btn btn-danger rounded-0 mr-1 mb-1 but-50"
                                    onClick={() =>
                                      this.product_minus(
                                        product.id,
                                        product.name,
                                        product.cost
                                      )
                                    }
                                  >
                                    <i className="fas fa-minus"></i>
                                  </button>
                                  <button
                                    type="button"
                                    className="btn btn-success rounded-0 mr-1 mb-1 but-50"
                                    onClick={() =>
                                      this.product_plus(
                                        product.id,
                                        product.name,
                                        product.cost
                                      )
                                    }
                                  >
                                    <i className="fas fa-plus"></i>
                                  </button>
                                </div>
                              ) : (
                                <div className="dood">
                                  <button
                                    type="button"
                                    className="btn btn-success rounded-0 mr-1 mb-1 but-100"
                                    onClick={() =>
                                      this.product_plus(
                                        product.id,
                                        product.name,
                                        product.cost
                                      )
                                    }
                                  >
                                    <i className="fas fa-plus"></i>
                                  </button>
                                </div>
                              )}
                            </div>
                          </div>
                        );
                      })}
                    </div>
                  </div>
                </div>
                <button
                  className="btn btn-warning order rounded-0 paymentBoxShow"
                  onClick={() => this.toggle_paymentBox()}
                >
                  <i className="fa fa-angle-double-up" aria-hidden="true"></i>
                </button>
                <div
                  className={
                    this.state.paymentBoxShow
                      ? "payments-side"
                      : "payments-side displayNone"
                  }
                >
                  <button
                    className="btn btn-warning order rounded-0"
                    onClick={() => this.toggle_paymentBox()}
                  >
                    <i
                      className="fa fa-angle-double-down"
                      aria-hidden="true"
                    ></i>
                  </button>
                  {this.state.order_payments.length > 0 ? (
                    <table>
                      <tbody>
                        {this.state.order_payments.map((payment, index) => {
                          return (
                            <tr key={index}>
                              <td>
                                {Moment(payment.created_at).format("Do, H:mm")}
                              </td>
                              <td>{payment.wallet.name}</td>
                              <td>{payment.wallet.account}</td>
                              <td>{payment.amount}</td>
                              <td>confirmed?</td>
                            </tr>
                          );
                        })}
                      </tbody>
                    </table>
                  ) : (
                    <p>
                      Тухайн захиалга гүйлгээ хийгээгүй эсвэл захиалгыг
                      сонгоогүй байна.
                    </p>
                  )}
                </div>
              </div>
            </div>
          </div>
        </div>
        <MoneyTransfers
          modalHide={this.modalHide.bind(this)}
          show_modal={this.state.show_money_transfer_modal}
          shift_worker={this.state.shiftWorker}
          {...this.props}
        />
        <ProductBalances
          modalHide={this.modalHide.bind(this)}
          show_modal={this.state.show_product_balances_modal}
          shift_worker={this.state.shiftWorker}
          {...this.props}
        />
      </div>
    );
  }
}