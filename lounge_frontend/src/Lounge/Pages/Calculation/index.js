import React, { Component } from "react";
import { store } from "react-notifications-component";
import { getUserId, getUser } from "../../../Main/Utils/Auth";
import IdleTimer from "react-idle-timer";

import MoneyTransfers from "./Components/Modals/MoneyTransfers";
import ProductBalances from "./Components/Modals/ProductBalances";
import DetialsInformation from "./Components/Modals/DetialsInformation";
import UnpaidOrders from "./Components/Modals/UnpaidOrders"
import Customer from "./Components/Modals/Customer";
import Clients from "./Components/Clients";
import Order from "./Components/Order";
import Orders from "./Components/Orders";
import Ebarimt from "./Components/Modals/Ebarimt";
import Dashboard from "./Components/Dashboard";
import ProductOpen from "./Components/Modals/ProductOpen"

export default class Calculations extends Component {
  constructor(props) {
    super(props);
    this.state = {
      loading: false,
      user_id: getUserId(),
      categories: [],
      products: [],
      clients: [],
      divisions: [],
      orders: [],
      underPaymentOrders: [],
      order_detials: [],
      order_payments: [],
      orderingList: [],
      orderDetailsList: [],
      shiftWorkers: [],
      unpaidOrders: [],
      productBalances: [],
      prevProductBalances: [],
      selected_shiftWorker: null,
      mTransfersData: [],
      workersData: [],
      can_open_products: [],

      shiftWorker: null,
      sel_parent_cat: null,
      sel_cat: null,
      show_dashboard: true,
      show_tables: false,
      show_orders: false,
      show_order: false,
      show_payment: false,
      show_detial: false,
      show_customer: false,
      show_ebarimt: false,
      show_unpaidOrders: false,
      show_addProducts: false,
      show_product_open: false,
      keyboardBoxShow: false,
      productBoxShow: false,
      show_money_transfer_modal: false,
      show_product_balances_modal: false,

      table_id: null,
      table_number: null,
      order_id: null,
      order_amount: null,
      division_id: null,
      worker_id: null,
      order_information: null,

      session_secund: 600,

      company_name: null,
      company_register: null,
      company_register_status: "0",
      searching_value: "",
      customer_mobile: ""
    };
    this.set_parent_cat = this.set_parent_cat.bind(this);
    this.set_cat = this.set_cat.bind(this);
    this.product_minus = this.product_minus.bind(this);
    this.product_plus = this.product_plus.bind(this);
    this.toggle_productBox = this.toggle_productBox.bind(this);
    this.toggle_keyboardBox = this.toggle_keyboardBox.bind(this);
    this.workerChanger = this.workerChanger.bind(this);
    this.customerChanger = this.customerChanger.bind(this);
    this.registerChanger = this.registerChanger.bind(this);
    this.set_customer_order = this.set_customer_order.bind(this);
    this.set_worker_order = this.set_worker_order.bind(this);

    this.idleTimer = null;
    this.handleOnAction = this.handleOnAction.bind(this);
    this.handleOnActive = this.handleOnActive.bind(this);
    this.handleOnIdle = this.handleOnIdle.bind(this);

    this.modalShow = this.modalShow.bind(this);

    this.shift_work_close = this.shift_work_close.bind(this);
    this.shift_work_open = this.shift_work_open.bind(this);

    this.set_division = this.set_division.bind(this)
    this.set_table = this.set_table.bind(this)
    this.set_order = this.set_order.bind(this)

    this.checkBalance = this.checkBalance.bind(this)
    this.printer = this.printer.bind(this)
    this.print_bill = this.print_bill.bind(this)
    this.order_print = this.order_print.bind(this)
    this.show_product_open_function = this.show_product_open_function.bind(this)
    this.loadingTrue = this.loadingTrue.bind(this)
    this.loadingFalse = this.loadingFalse.bind(this)
  }

  async loadingTrue(){
    await this.setState({
      loading:true
    });
  }

  async loadingFalse(){
    await this.setState({
      loading:false
    });
  }

  sendError(error){
    var myHeaders = new Headers();
    error = "shift_work: " + this.state.shiftWorker.id + ", user_id: " + getUserId() + ", error: " + error
    myHeaders.append("Content-Type", "application/json");
    var raw = "{\"error_value\": \"" + error.toString() + "\"}";

    var requestOptions = {
      method: 'POST',
      headers: myHeaders,
      body: raw,
      redirect: 'follow'
    };

    fetch("http://" + this.props.ip_address + "/api/error/", requestOptions)
      .then(response => response.text())
      .catch(error => console.log('error', error));
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
          message: "Үйлчилүүлэгчдийн мэдээллийг серверээс татаж чадсангүй. Системийн инженерт хандаж хэлнэ үү. " + error,
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, getWorkersData")
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        
        this.sendError("fetchError, getCategoriesData")
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        
        this.sendError("fetchError, getLastShiftWorker")
      });
  }

  async getOrdersData() {
    var addUrl;
    if (this.state.division_id !== null && this.state.table_id !== null) {
      addUrl =
        "&division=" +
        this.state.division_id +
        "&client=" +
        this.state.table_id;
    } else if (
      this.state.division_id !== null &&
      this.state.table_id === null
    ) {
      addUrl = "&division=" + this.state.division_id;
    } else if (
      this.state.division_id === null &&
      this.state.table_id === null
    ) {
      addUrl = "";
    }

    var url ="http://" + this.props.ip_address + "/api/lounge/orders/?shift_work=" + this.state.shiftWorker.id + addUrl;
    
    await fetch(url, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        await this.setState({
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        
        this.sendError("fetchError, getOrdersData")
      });
  }

  async getOrderDetialsData() {
    if (this.state.order_id) {
      await fetch(
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
          await this.setState({
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
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 2000,
              onScreen: true,
            },
          });
          
          this.sendError("fetchError, getOrderDetialsData - 1")
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
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 2000,
              onScreen: true,
            },
          });
          this.sendError("fetchError, getOrderDetialsData - 2")
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
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 2000,
              onScreen: true,
            },
          });
          this.sendError("fetchError, getOrderPaymentsData")
        });
      } 
    // else {
    //   fetch("http://" + this.props.ip_address + "/api/lounge/orderDetials/", {
    //     method: "GET",
    //     headers: {
    //       "Content-Type": "application/json",
    //       Authorization: "Token " + this.props.token,
    //     },
    //   })
    //     .then(async (response) => {
    //       const data = await response.json();
    //       await this.setState({
    //         order_payments: data,
    //       });
    //     })
    //     .catch((error) => {
    //       store.addNotification({
    //         title: "Анхаар!",
    //         message:
    //           "Алдаа гарлаа. Системийн инженертэй холбогдож хэлнэ үү! Алдааны мэдээлэл: " +
    //           error,
    //         type: "danger",
    //         insert: "top",
    //         container: "bottom-right",
    //         animationIn: ["animated", "fadeIn"],
    //         animationOut: ["animated", "fadeOut"],
    //         dismiss: {
    //           duration: 2000,
    //           onScreen: true,
    //         },
    //       });
    //     });
    // }
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, getDivisionsData")
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, getClientsData")
      });
  }

  async clearFilter(){
    await this.setState({
      searching_value: "",
      sel_parent_cat: null,
      sel_cat: null
    });
    this.getProductsData()
  }

  async searchingProduct(e, vtype){
    if(vtype === "input"){
      e.persist();
      e = e.target.value
    }
    
    await this.setState({
      searching_value: e,
      sel_parent_cat: null,
      sel_cat: null
    });
    this.getProductsData()
  }

  async getProductsData() {
    var url;
    if (this.state.sel_parent_cat == null && this.state.sel_cat == null) {
      url = "http://" + this.props.ip_address + "/api/lounge/products/"
      if(this.state.searching_value !== ""){
        url = url + "?search=" + this.state.searching_value
      }
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
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 2000,
              onScreen: true,
            },
          });
          this.sendError("fetchError, getProductsData - 1")
        });
    } else {
      if (this.state.sel_parent_cat != null && this.state.sel_cat == null) {
        url =
          "http://" +
          this.props.ip_address +
          "/api/lounge/products/?categories=" +
          this.state.sel_parent_cat.toString();
        if(this.state.searching_value !== ""){
          url = url + "&search=" + this.state.searching_value
        }
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
              container: "bottom-right",
              animationIn: ["animated", "fadeIn"],
              animationOut: ["animated", "fadeOut"],
              dismiss: {
                duration: 2000,
                onScreen: true,
              },
            });
            this.sendError("fetchError, getProductsData - 2")
          });
      }
      if (this.state.sel_cat != null) {
        url =
          "http://" +
          this.props.ip_address +
          "/api/lounge/products/?categories=" +
          this.state.sel_cat.toString();
        
        if(this.state.searching_value !== ""){
          url = url + "&search=" + this.state.searching_value
        }
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
              container: "bottom-right",
              animationIn: ["animated", "fadeIn"],
              animationOut: ["animated", "fadeOut"],
              dismiss: {
                duration: 2000,
                onScreen: true,
              },
            });
            this.sendError("fetchError, getProductsData - 3")
          });
      }
    }
  }

  async set_parent_cat(e) {
    await this.setState({
      sel_parent_cat: e,
      sel_cat: null,
      searching_value: ""
    });
    await this.getProductsData();
  }

  async set_cat(e) {
    await this.setState({
      sel_cat: e,
      searching_value: ""
    });
    await this.getProductsData();
  }

  async show_dashboard() {
    await this.getUnderPaymentOrders()
    await this.setState({
      show_dashboard: true,
      show_tables: false,
      show_order: false,
      show_orders: false,
      show_payment: false,
      show_detial: false,
      keyboardBoxShow: false,
      show_customer: false,
      show_ebarimt: false,
      order_information: null,
    });
  }

  async show_tables() {
    await this.setState({
      show_dashboard: false,
      show_tables: true,
      show_order: false,
      show_orders: false,
      show_payment: false,
      show_detial: false,
      keyboardBoxShow: false,
      show_customer: false,
      show_ebarimt: false,
      order_information: null,
    });
  }

  async show_orders() {
    await this.setState({
      show_dashboard: false,
      show_tables: false,
      show_order: false,
      show_orders: true,
      show_payment: false,
      show_detial: false,
      keyboardBoxShow: false,
      show_customer: false,
      show_ebarimt: false,
      order_information: null,
      order_id: null,
      order_detials: [],
      
      company_name: null,
      company_register: null,
      company_register_status: "0"
    });
    this.getOrdersData();
  }

  async show_order() {
    await this.setState({
      show_dashboard: false,
      show_tables: false,
      show_order: true,
      show_orders: false,
      show_payment: false,
      show_detial: false,
      show_customer: false,
      show_ebarimt: false,
      keyboardBoxShow: false,
      productBoxShow: true,
      customer_mobile: null,
      company_name: null,
      company_register: null,
      company_register_status: "0"
    });
  }

  async new_order() {
    await this.setState({
      order_id: null,
      order_detials: [],
      order_information: null,
      order_payments: [],
      order_amount: null,
    });
    await this.show_order()
  }

  async show_payment() {
    await this.setState({
      show_dashboard: false,
      show_tables: false,
      show_order: false,
      show_orders: false,
      show_payment: true,
      show_detial: false,
      show_customer: false,
      show_ebarimt: false,
      order_information: null,
    });
  }

  async show_detial(index) {
    await this.setState({
      show_dashboard: false,
      show_tables: false,
      show_order: true,
      show_orders: false,
      show_payment: false,
      show_detial: true,
      show_customer: false,
      show_ebarimt: false,
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
      show_dashboard: false,
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
      show_dashboard: false,
      show_tables: false,
      show_order: true,
      keyboardBoxShow: true,
      productBoxShow: false,
      show_unpaidOrders: false
    });
    await this.getOrderDetialsData();
    await this.getOrderPaymentsData();
  }

  async back_orders() {
    this.getOrdersData()
    await this.setState({
      show_orders: true,
      show_order: false,
    });
  }

  async back_tables() {
    // this.getClientsData()
    await this.setState({
      show_orders: false,
      show_tables: true,
    });
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

  async getUnderPaymentOrders() {
    await fetch(
      "http://" + this.props.ip_address + "/api/lounge/loungeUnderPayments/",
      {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
      }
    )
      .then((response) => response.json())
      .then(async (orders) => {
        await this.setState({ underPaymentOrders: orders });
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message: "Backend сервертэй холбогдож чадсангүй." + error,
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      });
  }

  async checkBalance(id) {
    var response = await fetch(
      "http://" + this.props.ip_address + "/api/balanceChecker/19/" + id,
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
        return data
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Алдаа гарлаа. Бүтээгдэхүүний орцийг шалгах явцад алдаа гарлаа.",
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, checkBalance")
      });
    return response
  }

  async product_plus(id, name, cost) {
    var balance_obj = await this.checkBalance(id)
    console.log(balance_obj)
    const index = await this.getIndex(id);
    if (index === -1) {
      if(balance_obj['balance'] > 0){
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
      }else{
        var can_open = false
        console.log(balance_obj['zadlah_product'])
        balance_obj['zadlah_product'].map(async (p_product)=>{
          if(p_product['quantity'] > 0){
            can_open = true
          }
          return null
        })

        if(can_open){
          await this.setState({
            can_open_products: balance_obj['zadlah_product'],
          });
          await this.show_product_open_function()
        }
        store.addNotification({
          title: "Анхаар!",
          message: "Бараа гарах боломжгүй.",
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, product_plus - 1")
      }
    } else {
      if(balance_obj['balance'] > this.state.orderingList[index].quantity){
        await this.setState((prevState) => {
          const newItems = [...prevState.orderingList];
          newItems[index].quantity = prevState.orderingList[index].quantity + 1;
          newItems[index].subtotal =
            prevState.orderingList[index].quantity * cost;
          return { orderingList: newItems };
        });
      }else{
        store.addNotification({
          title: "Анхаар!",
          message: "Бараа хамгийн ихдээ " + balance_obj['balance'] + " ширхэг гарна.",
          type: "warning",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, product_plus - 2")
      }
    }
  }

  UNSAFE_componentWillMount() {
    this.getUnderPaymentOrders();
    this.getCategoriesData();
    this.getProductsData();
    this.getDivisionsData();
    this.getLastShiftWorker();
    this.getWorkersData();
    this.getShiftWorksData();
    this.getUnpaidOrdersData();
    this.getMTransfersData();
    this.getProductBalancesData()
  }

  async getProductBalancesData() {
    await fetch(
      "http://" + this.props.ip_address + "/api/lounge/BarmenProductBalances/",
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
          productBalances: data,
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, getProductBalancesData")
      });
  }

  
  async getMTransfersData() {
    await fetch(
      "http://" + this.props.ip_address + "/api/lounge/loungeMoneyTransfers/",
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
          mTransfersData: data,
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, getMTransfersData")
      });
  }

  async getUnpaidOrdersData(id=null) {
    var url
    if(this.state.selected_shiftWorker !== null){
        url = "http://" + this.props.ip_address + "/api/lounge/unpaidOrders/?shift_work=" + this.state.selected_shiftWorker
    }else{
        url = "http://" + this.props.ip_address + "/api/lounge/unpaidOrders/"
    }
    await fetch(
        url,
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
            unpaidOrders: data,
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, getUnpaidOrdersData")
      });
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
      show_detial: false,
      show_customer: false,
      show_ebarimt: false,
      show_unpaidOrders: false,
      show_product_open:false,
      can_open_products: []
    });
  }

  async modalShow(value) {
    if (value === "moneyTransfers") {
      await this.getMTransfersData()
      await this.setState({
        show_money_transfer_modal: true,
      });
    }
    if (value === "productBalances") {
      await this.getProductBalancesData()
      await this.setState({
        show_product_balances_modal: true,
      });
    }
    if (value === "unpaidOrders") {
      await this.getUnpaidOrdersData()
      await this.setState({
        show_unpaidOrders: true,
      });
    }
  }

  async show_customer() {
    await this.setState({
      show_customer: true,
      show_ebarimt: false,
      show_orders: false,
      show_tables: false,
      show_order: true,
      show_payment: false,
      productBoxShow: false,
      keyboardBoxShow: false,
    });
  }

  async show_product_open_function() {
    await this.setState({
      show_product_open: true
    });
  }

  async show_ebarimt() {
    await this.setState({
      show_customer: false,
      show_ebarimt: true,
      show_orders: false,
      show_tables: false,
      show_order: true,
      show_payment: false,
      productBoxShow: false,
      keyboardBoxShow: false,

      company_name: null,
      company_register: null,
      company_register_status: "0",
    });
  }

  async clearButton() {
    await this.setState({
      orderingList: [],
    });
  }

  async printer(order, detials) {
    var Obj = {
      order: order,
      detials: detials,
    };
    console.log(Obj)
    const url = "http://" + this.props.ip_address + "/printer/";
    await fetch(url, {
      method: "POST",
      body: JSON.stringify(Obj),
    })
    .then((results) => {
      return results;
    })
  }

  async doOrderButton() {
    await this.loadingTrue()
    if (
      this.state.division_id &&
      this.state.table_id &&
      !this.state.order_id &&
      !this.state.shiftWorker.finished
    ){
      await this.state.orderingList.map(async (detail) => {
        var detailObj = {
          quantity: detail.quantity,
          discount: parseInt(detail.cost) * parseInt(detail.quantity),
          discount_rate: detail.discount_rate,
          subtotal: detail.subtotal,
          is_deleted: false,
          created_by: this.state.user_id,
          client: this.state.table_id,
          fr_client: 19,
          order: 1,
          product: detail.id,
          shift_work: this.state.shiftWorker.id,
        };

        await this.setState((prevState) => ({
          orderDetailsList: [...prevState.orderDetailsList, detailObj]
        }));
      });

      var orderObj = {
        amount: 0,
        discount: 0,
        discounted_amount: 0,
        discounted_percent: 0,
        is_now: true,
        status: "Төлбөр төлөгдөөгүй.",
        client: this.state.table_id,
        division: this.state.division_id,
        created_by: this.state.user_id,
        required_date: new Date(),
        shift_work: this.state.shiftWorker.id,
        order_detials : this.state.orderDetailsList,
      };

      var myHeaders = new Headers();
      myHeaders.append("Content-Type", "application/json");
      myHeaders.append("Authorization", "Token " + this.props.token);

      var raw = JSON.stringify(orderObj);

      var requestOptions = {
        method: 'POST',
        headers: myHeaders,
        body: raw,
        redirect: 'follow'
      };
      var status = false
      const response = await fetch("http://" + this.props.ip_address + "/api/lounge/postOrder/", requestOptions)
        .then((results) => {
          status = results.ok;
          return results;
        })
        .then((results) => {
          results = results.json();
          return results;
        })
        .catch(error => {
          store.addNotification({
            title: "Анхаар!",
            message:
              "Захиалгын detail үүссэнгүй. Системийн инженерт хандана уу.",
            type: "danger",
            insert: "top",
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 2000,
              onScreen: true,
            },
          });
          this.sendError("fetchError, " + error)
        });
      
      if(status){
        await this.setState({
          order_id: response['id'],
        });
        await this.set_order_information(response['id']);
        await this.getOrderDetialsData();
        store.addNotification({
          title: "Амжилттай",
          message:
            "Захиалгын detail амжилттай үүслээ.",
          type: "success",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        var printObj = {
          client: this.state.table_id,
          division: this.state.division_id,
        };
        this.printer(printObj, this.state.orderingList)
        await this.setState({
          order_id: response['id'],
          orderingList: [],
          orderDetailsList: [],
        });
      }
    } else {
      if (!this.state.division_id || !this.state.table_id) {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Client-ээ сонгоно уу! (ширээний дугаар, өрөөний дугаарыг сонгох шаардлагатай!))",
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
      } else if (this.state.shiftWorker.finished) {
        store.addNotification({
          title: "Анхаар!",
          message: "Ээлж нээгээгүй байгаа тул захиалга авч болохгүй!",
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
      }
    }
    await this.loadingFalse()
  }

  async updateOrderButton() {
    if (
      this.state.division_id &&
      this.state.table_id &&
      this.state.order_id &&
      !this.state.shiftWorker.finished
    ) {
      var haveError = false
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
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 2000,
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
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 2000,
              onScreen: true,
            },
          });
          this.sendError("fetchError, updateOrderButton - 2")
        }
      })

      await this.set_order_information(this.state.order_id)
      await this.getOrderDetialsData();
    
      var printerObj = {
        client: this.state.table_id,
        division: this.state.division_id,
      };
      this.printer(printerObj, this.state.orderingList)

      if(!haveError) {
        await this.setState({
          orderingList: [],
        });
      }
    }
  }

  async orderDetailsBack(id, name, quantity, subtotal) {
    var text = "№" + id + ". " + name + " x " + quantity + " = " + subtotal + "₮-ийн захиалгыг та буцаахдаа итгэлтэй байна?"
    let confirmAction = window.confirm(text);

    if(confirmAction){
      const url ="http://" + this.props.ip_address + "/api/lounge/postOrderDetail/" + id.toString() + "/";
      var myHeaders = new Headers();
      myHeaders.append("Accept", "application/json");
      myHeaders.append("Content-Type", "application/json");
      myHeaders.append("Authorization", "Token " + this.props.token);

      var raw = JSON.stringify({
        "is_deleted": true
      });

      var requestOptions = {
        method: 'PATCH',
        headers: myHeaders,
        body: raw,
        redirect: 'follow'
      };

      await fetch(url, requestOptions)
        .then(response => response.text())
        .then(async result => {
          store.addNotification({
            title: "Амжилттай",
            message: "Order Detail амжилттай устгагдлаа.",
            type: "success",
            insert: "top",
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 2000,
              onScreen: true,
            },
          });
          await this.set_order_information(this.state.order_id);
          await this.getOrderDetialsData()
        })
        .catch(error => {
          console.log('error', error)
          store.addNotification({
            title: "Анхаар!",
            message:
              "Order Detail буцаах үйлдэл амжилтгүй боллоо. Системийн инженерт хандана уу.",
            type: "danger",
            insert: "top",
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 2000,
              onScreen: true,
            },
          });
          this.sendError("fetchError, orderDetailsBack")
        });
    }
  }

  async paymentBack(id, name, amount) {
    var text = "№" + id + ". " + name + "-аас " + amount + "₮-ийн гүйлгээг та буцаахдаа итгэлтэй байна?"
    let confirmAction = window.confirm(text);

    if(confirmAction){
      const url ="http://" + this.props.ip_address + "/api/lounge/payments/" + id.toString() + "/";
      var myHeaders = new Headers();
      myHeaders.append("Accept", "application/json");
      myHeaders.append("Content-Type", "application/json");
      myHeaders.append("Authorization", "Token " + this.props.token);

      var raw = JSON.stringify({
        "is_deleted": true
      });

      var requestOptions = {
        method: 'PATCH',
        headers: myHeaders,
        body: raw,
        redirect: 'follow'
      };

      await fetch(url, requestOptions)
        .then(response => response.text())
        .then(async result => {
          store.addNotification({
            title: "Амжилттай",
            message: "Гүйлгээ амжилттай устгагдлаа.",
            type: "success",
            insert: "top",
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 2000,
              onScreen: true,
            },
          });
          await this.getOrderPaymentsData();
        })
        .catch(error => {
          console.log('error', error)
          store.addNotification({
            title: "Анхаар!",
            message:
              "Гүйлгээг буцаах үйлдэл амжилтгүй боллоо. Системийн инженерт хандана уу.",
            type: "danger",
            insert: "top",
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 2000,
              onScreen: true,
            },
          });
          this.sendError("fetchError, orderDetailsBack")
        });
    }
  }

  toggle_productBox() {
    this.setState({ productBoxShow: !this.state.productBoxShow });
  }

  toggle_keyboardBox() {
    if(this.state.productBoxShow){
      this.setState({ 
        keyboardBoxShow: true,
        productBoxShow: false
      });
    }else{
      this.setState({ keyboardBoxShow: !this.state.keyboardBoxShow });
    }
  }

  async paymentInfoReceiver(status) {
    if (status) {
      await this.getOrdersData();
      await this.getOrderDetialsData();
      await this.getOrderPaymentsData();
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

  async registerChecker(register){
    var url = "http://" + this.props.ip_address + "/api/bill/registerChecker?register=" + register
    var response = await fetch(url, {
        method: "GET",
      })
      .then(response=>response.json())
      .then(data=>{return data})
    return response
  }

  async registerChanger(e) {
    e.persist();
    var status
    var company = ""
    if(e.target.value.length === 0){
      status = "0"
    }else if(e.target.value.length < 7){
      status = "1"
    }else if(e.target.value.length > 7){
      status = "2"
    }else{
      var checking_value = await this.registerChecker(e.target.value)
      if(checking_value['found']){
        status = "4"
        company = checking_value['name']
      }else{
        status = "3"
      }
    }

    await this.setState({
      company_register: e.target.value,
      company_name: company,
      company_register_status: status,
    });
  }
 
  async print_bill() {
    if(this.state.order_id){
      var urla = "http://" + this.props.ip_address + "/api/bill/createBill?order=" + this.state.order_id + "&printer_number=1"
      if(this.state.company_register){
        urla = urla + "&register=" + this.state.company_register
      }
      await fetch(urla, {
        method: "GET",
      })
      .then(response=>response.json())
      .then(data=>{
        if(data['success']){
          store.addNotification({
            message: "Баримт амжилттай хэвлэгдлээ.",
            type: "success",
            insert: "top",
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 3000,
              onScreen: true,
            },
          });
          this.modalHide()

        }else{
          store.addNotification({
            message: data['errorCode'],
            type: "danger",
            insert: "top",
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 3000,
              onScreen: true,
            },
          });
          this.sendError("fetchError, print_bill")
        }
      })
    }
  }

  order_print(order_id) {
    console.log("order_print")
    var url = "http://" + this.props.ip_address + "/api/order/print?order=" + order_id + "&printer=1"
    fetch(url, {
      method: "GET",
    })
    .then(response=>response.json())
    .then(data=>{
      if(data['success']){
        store.addNotification({
          message: "Order амжилттай хэвлэгдлээ.",
          type: "success",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 3000,
            onScreen: true,
          },
        });
      }else{
        store.addNotification({
          message: data['errorCode'],
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 3000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, order_print")
      }
    })
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
            show_customer: false
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
      }
    }
  }

  getPrevBalancesData() {
    fetch(
      "http://" + this.props.ip_address + "/api/lounge/balanceLogs/?shift_work=" + this.state.shiftWorkers[1].id,
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
          prevProductBalances: data,
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, getPrevBalancesData")
      });
  }

  async getShiftWorksData() {
    await fetch(
      "http://" + this.props.ip_address + "/api/lounge/shiftWorks/",
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
          shiftWorkers: data,
        });
        this.getPrevBalancesData()
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Алдаа гарлаа. Системийн инженертэй холбогдож хэлнэ үү! Алдааны мэдээлэл: " +
            error,
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, getShiftWorksData")
      });
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
            show_customer: false
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
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
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
      }
    }
  }

  async set_order_information(id) {
    var url = "http://" + this.props.ip_address + "/api/lounge/orderUpdate/" + id + "/";
    await fetch(url, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    }).then(async (response) => {
      const data = await response.json();
      await this.setState({
        order_information: data,
        division_id: data["division"],
        table_id: data["client"].id,
        table_number: data["client"].number,
        division_name: data["client"].division.name,
      });
    });
    this.getClientsData()
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

  async shift_work_open() {
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
      if (results.ok) {
        store.addNotification({
          title: "Амжилттай!",
          message: "Ээлжийг амжилттай нээлээ.",
          type: "success",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        window.location.reload(); 
      } else {
        store.addNotification({
          title: "Амжилтгүй!",
          message: "Ээлжийг нээж чадсангүй. Системийн инженерт хандана уу.",
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, shift_work_open")
      }
      return results;
    });
    this.getLastShiftWorker();
  }

  async shiftWorkerUnpaidOrderChecker(id){
      const turl = "http://" + this.props.ip_address + "/api/shiftWorkUnpaidOrderChecker/" + id.toString()
      var response = await fetch(turl, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
      })
      .then((response) => response.json())
      .then(async (obj) => {
        return obj.can_i_end
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Ээлж хаах эрх үүссэн үгүйг шалгах явцад алдаа гарлаа. " +
            error,
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, shiftWorkerUnpaidOrderChecker")
      });

    return response
  }

  async shift_work_close() {
    if (this.state.shiftWorker.worker.id === getUserId()) {
      var can_i_end = await this.shiftWorkerUnpaidOrderChecker(this.state.shiftWorker.id)
      if(can_i_end){
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
              container: "bottom-right",
              animationIn: ["animated", "fadeIn"],
              animationOut: ["animated", "fadeOut"],
              dismiss: {
                duration: 2000,
                onScreen: true,
              },
            });
          } else {
            store.addNotification({
              title: "Амжилтгүй!",
              message: "Ээлжийг хааж чадсангүй. Системийн инженерт хандана уу.",
              type: "danger",
              insert: "top",
              container: "bottom-right",
              animationIn: ["animated", "fadeIn"],
              animationOut: ["animated", "fadeOut"],
              dismiss: {
                duration: 2000,
                onScreen: true,
              },
            });
            this.sendError("fetchError, shift_work_close - 1")
          }
          return results;
        });
      }else{
        store.addNotification({
          title: "Анхаар!",
          message: "Ээлж хаахад төлбөр төлөгдөөгүй, хүнд харгалзаагүй Order байх ёсгүй!",
          type: "warning",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
      }
      this.getLastShiftWorker();
    }else{
      store.addNotification({
        title: "Амжилтгүй!",
        message: "Ээлжийг нээсэн хүн зөвхөн ээлжийг хаах ёстой!",
        type: "warning",
        insert: "top",
        container: "bottom-right",
        animationIn: ["animated", "fadeIn"],
        animationOut: ["animated", "fadeOut"],
        dismiss: {
          duration: 2000,
          onScreen: true,
        },
      });
    }
  }

  async show_division_orders (){
    await this.setState({
      table_id: null,
      table_number: null
    })
    this.getOrdersData()
  }

  async show_all_orders (){
    await this.setState({
      table_id: null,
      table_number: null,
      division_id: null,
      division_name: null,
      clients:[]
    })
    this.getOrdersData()
  }

  async product_convert_to_commodity(id){
    this.modalHide()
    var requestOptions = {
      method: 'POST',
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
      redirect: 'follow'
    };
    var url = "http://" + this.props.ip_address + "/productToCommodity/19/" + id
    await fetch(url, requestOptions)
      .then(response => response.text())
      .then(async (result) => {
        console.log(result)
        if(result['okey'] === true){
          store.addNotification({
            title: "Амжилттай!",
            message: "Амжилттай задаллаа",
            type: "success",
            insert: "top",
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 2000,
              onScreen: true,
            },
          });
        }
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Бүтээгдэхүүнийг материал болгох хувиргах явцад алдаа гарлаа. Системийн инженерт хандана уу!" +
            error,
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 2000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, product_convert_to_commodity - 1")
      })
  }

  render() {
    var orderingTotalAmount = 0;
    this.state.orderingList.map(
      (ordering) =>
        (orderingTotalAmount =
          parseInt(orderingTotalAmount) + parseInt(ordering.subtotal))
    );

    return (
      <div className="body">
        {this.state.loading ? 
        <div className="loadingBox">
          <div className="lds-default"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
        </div>
        : null}
        <IdleTimer
          ref={(ref) => {
            this.idleTimer = ref;
          }}
          timeout={1000 * this.state.session_secund}
          onActive={this.handleOnActive}
          onIdle={this.handleOnIdle}
          onAction={this.handleOnAction}
          debounce={250}
          capture={true}
        />
        <div className="header">
          <div className="brand">
            <img src="/lounge_app_logo.png" alt="Tesoro Lounge Logo" />
          </div>
          <div className="center">
            <div className="barmen">
              <i className="fa fa-user" aria-hidden="true"></i>
              <div className="info">
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
                <div className="name">{getUser()}</div>
              </div>
            </div>
          </div>
          <div className="logout">
            <button
              type="button"
              onClick={this.props.signOut}
            >
              <i className="fa fa-sign-out" aria-hidden="true"></i>
            </button>
          </div>
          <div className="dropdown menu">
            <button className="dropbtn"><i className="fa fa-bars" aria-hidden="true"></i></button>
            <div className="dropdown-content">
              <button className=""onClick={() => this.modalShow("moneyTransfers")}>
                <i className="fa fa-exchange" aria-hidden="true"></i>{" "}
                Гүйлгээний жагсаалт
              </button>
              <button
                className="" onClick={() => this.modalShow("productBalances")}>
                <i className="fa fa-balance-scale" aria-hidden="true"></i>{" "}
                Барааны үлдэгдэл
              </button>
              <button className="" onClick={() => this.modalShow("unpaidOrders")}>
                <i className="fa fa-balance-scale" aria-hidden="true"></i>{" "}
                Төлөгдөөгүй тооцоонууд
              </button>
              {this.state.shiftWorker && this.state.shiftWorker.finished ? (
                <button className="" onClick={this.shift_work_open}>
                  <i className="fa fa-unlock" aria-hidden="true"></i> Ээлж нээх
                </button>
              ) : null}
              {this.state.shiftWorker &&
              !this.state.shiftWorker.finished &&
              this.state.shiftWorker.worker.id === getUserId() ? (
                <button className="" onClick={this.shift_work_close}>
                  <i className="fa fa-lock" aria-hidden="true"></i> Ээлж хаах
                </button>
              ) : null}
            </div>
          </div>
        </div>
        <div className="info-row">
          <div className="d-inline-block per">
            <div className="white">
              <i className="fa fa-home" /> : {" "}{this.state.division_name}
            </div>
          </div>
          <div className="d-inline-block per">
            <div className="white">
              <i className="fas fa-map-marker-alt" /> :{" "}{this.state.table_number}
            </div>
          </div>
          <div className="d-inline-block per">
            <div className="white">
              <i className="fas fa-file-invoice" /> :{" "}{this.state.order_id}
            </div>
          </div>
        </div>
        <div className="main">
          <Dashboard
            show_modal={this.state.show_dashboard}
            orders={this.state.underPaymentOrders}
            set_order={this.set_order}
            {...this.props}
          />
          <Clients
            modalHide={this.modalHide.bind(this)}
            show_modal={this.state.show_tables}
            divisions={this.state.divisions}
            clients={this.state.clients}
            selected_division={this.state.division_id}
            selected_client={this.state.table_id}
            set_division = {this.set_division}
            set_table = {this.set_table}
            {...this.props}
          />
          <Orders
            modalHide={this.modalHide.bind(this)}
            show_modal={this.state.show_orders}
            orders={this.state.orders}
            selected_order={this.state.order_id}
            selected_division={this.state.division_id}
            selected_division_name={this.state.division_name}
            selected_client={this.state.table_id}
            selected_client_number={this.state.table_number}
            set_order={this.set_order}
            show_division_orders={this.show_division_orders.bind(this)}
            show_all_orders={this.show_all_orders.bind(this)}
            back_tables={this.back_tables.bind(this)}
            show_order={this.show_order.bind(this)}
            new_order={this.new_order.bind(this)}
            {...this.props}
          />
          <Order
            modalHide={this.modalHide.bind(this)}
            show_modal={this.state.show_order}
            order_information={this.state.order_information}
            shift_worker={this.state.shiftWorker}
            order_detials={this.state.order_detials}
            order_payments={this.state.order_payments}
            user_id={this.state.user_id}
            back_orders = {this.back_orders.bind(this)}
            show_keyboard = {this.state.keyboardBoxShow}
            toggle_keyboard = {this.toggle_keyboardBox}
            show_product = {this.state.productBoxShow}
            toggle_product = {this.toggle_productBox}
            order_id={this.state.order_id}
            paymentInfoReceiver={this.paymentInfoReceiver.bind(this)}
            show_customer={this.show_customer.bind(this)}
            show_ebarimt={this.show_ebarimt.bind(this)}
            passenger={this.customerChanger}
            searchingProduct={this.searchingProduct.bind(this)}
            searching_value={this.state.searching_value}
            clearFilter={this.clearFilter.bind(this)}

            categories={this.state.categories}
            products={this.state.products}
            sel_parent_cat={this.state.sel_parent_cat}
            set_parent_cat={this.set_parent_cat}
            sel_cat={this.state.sel_cat}
            set_cat={this.set_cat}
            checkingInOrder={this.checkingInOrder.bind(this)}
            orderingList={this.state.orderingList}
            product_plus={this.product_plus}
            product_minus={this.product_minus}
            show_detial={this.show_detial.bind(this)}
            clearButton={this.clearButton.bind(this)}
            updateOrderButton={this.updateOrderButton.bind(this)}
            doOrderButton={this.doOrderButton.bind(this)}
            order_print = {this.order_print}
            orderDetailsBack = {this.orderDetailsBack.bind(this)}
            paymentBack = {this.paymentBack.bind(this)}
            {...this.props}
          />
        </div>
        <div className="footer">
          <button className="d-inline-block per" onClick={() => this.show_dashboard()}>
              <i className="fa fa-home" />
          </button>
          <button className="d-inline-block per" onClick={() => this.show_tables()}>
              <i className="fa fa-map-marker" />
          </button>
          <button className="d-inline-block per" onClick={() => this.show_orders()}>
              <i className="fas fa-bars" />
          </button>
          <button className="d-inline-block per" onClick={() => this.show_order()}>
              <i className="fas fa-plus"/>
          </button>
        </div>
        <MoneyTransfers
          modalHide={this.modalHide.bind(this)}
          show_modal={this.state.show_money_transfer_modal}
          shift_worker={this.state.shiftWorker}
          mTransfersData={this.state.mTransfersData}
          {...this.props}
        />
        <ProductBalances
          modalHide={this.modalHide.bind(this)}
          show_modal={this.state.show_product_balances_modal}
          shift_worker={this.state.shiftWorker}
          shift_workers={this.state.shiftWorkers}
          prevProductBalances={this.state.prevProductBalances}
          productBalances={this.state.productBalances}
          {...this.props}
        />
        <UnpaidOrders
          modalHide={this.modalHide.bind(this)}
          show_modal={this.state.show_unpaidOrders}
          shift_worker={this.state.shiftWorker}
          shift_workers={this.state.shiftWorkers}
          set_order={this.set_order}
          unpaidOrders={this.state.unpaidOrders}
          {...this.props}
        />
        {this.state.order_information ? (
          <DetialsInformation
            modalHide={this.modalHide.bind(this)}
            show_modal={this.state.show_detial}
            // orderingList={this.state.orderingList}
            order_id={this.state.order_id}
            order_payments={this.state.order_payments}
            order_information={this.state.order_information}
            order_detials={this.state.order_detials}
            show_order={this.show_order}
            set_order_information={this.set_order_information.bind(this)}
            {...this.props}
          />
        ): null}
        
        <Customer
          modalHide={this.modalHide.bind(this)}
          show_modal={this.state.show_customer}
          show_order={this.show_order}
          customer_mobile={this.state.customer_mobile}
          customerChanger={this.customerChanger}
          set_customer_order={this.set_customer_order}
          workerChanger={this.workerChanger}
          workersData={this.state.workersData}
          set_worker_order={this.set_worker_order}
          order_information={this.state.order_information}
          {...this.props}
        />

        <Ebarimt
          modalHide={this.modalHide.bind(this)}
          show_modal={this.state.show_ebarimt}
          show_ebarimt={this.show_ebarimt}
          order_information={this.state.order_information}
          registerChanger={this.registerChanger}
          company_name={this.state.company_name}
          company_register_status={this.state.company_register_status}
          print_bill = {this.print_bill}
          {...this.props}
        />

        <ProductOpen
          modalHide={this.modalHide.bind(this)}
          show_modal={this.state.show_product_open}
          products={this.state.can_open_products}
          product_convert_to_commodity={this.product_convert_to_commodity.bind(this)}
          {...this.props}
        />
      </div>
    );
  }
}
