import React, { Component } from 'react';

export default class Clients extends Component {
  render() {
    return (
      <div className={this.props.show_modal ? "show" : "hide" }>
          <div className="clients-box">
            <div className="box-heading">
                {this.props.divisions.map((division, index)=>{
                    return (
                        <div className="division" key={index}>
                            <button className={this.props.selected_division === division.id ? "white active" : "white"} 
                                onClick={() =>
                                    this.props.set_division(
                                      division.id,
                                      division.name
                                    )
                                }>
                                {division.name}
                            </button>
                        </div>
                    )
                })}
            </div>
            <div className="box-body">
                {this.props.clients.map((client, index)=>{
                    return (
                        <div className="client" key={index}>
                            <button className={this.props.selected_client === client.id ? "white active" : "white"} 
                                onClick={() =>
                                    this.props.set_table(
                                        client.id,
                                        client.number
                                    )
                                }>
                                {client.description ? client.description : client.number}
                            </button>
                        </div>
                    )
                })}
            </div>
          </div>
      </div>
    );
  }
}
