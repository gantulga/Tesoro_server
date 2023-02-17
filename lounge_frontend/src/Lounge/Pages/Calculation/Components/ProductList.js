import React, { Component } from 'react';

export default class ProductList extends Component {
    constructor(props) {
        super(props)
        this.bodyRef = React.createRef()
    }

    async scroll_to_top() {
        this.bodyRef.current.scrollTo(0, 0);
    }
    
    render() {
        return (
            <>
                <div className="button-side">
                    {this.props.categories.map((cat, index) => {
                    if (cat.parent === null) {
                        return (
                        <button
                            key={index}
                            type="button"
                            className={this.props.sel_parent_cat === cat.id ? "active" : null}
                            onClick={() => {
                                this.props.set_parent_cat(cat.id)
                                this.scroll_to_top()
                            }}
                        >
                            {cat.name}
                        </button>
                        );
                    } else {
                        return null;
                    }
                    })}
                    <input 
                        placeholder='Хайлт' 
                        className="searchProductInput"
                        type="text"
                        name="searching_value"
                        value={this.props.searching_value}
                        onChange={(e) => this.props.searchingProduct(e, "input")}
                    />
                    <button
                        type="button"
                        onClick={() => {
                            this.props.clearFilter()
                        }}
                        className="refreshBtn"
                    >
                        <i className="fas fa-refresh"></i>
                    </button>
                </div>
                <div className="body-side" ref={this.bodyRef}>
                    <div className="child-cat">
                        {this.props.categories.map((cat, index) => {
                        if (
                            cat.parent !== null &&
                            cat.parent === this.props.sel_parent_cat
                        ) {
                            return (
                            <button
                                key={index}
                                type="button"
                                className={this.props.sel_parent_cat === cat.id ? "active" : null}
                                onClick={() => this.props.set_cat(cat.id)}
                            >
                                {cat.name}
                            </button>
                            );
                        } else {
                            return null;
                        }
                        })}
                    </div>
                    <div className="products">
                        {this.props.products.map((product, index) => {
                            return (
                                <div className="productBox" key={index}>
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
                                            <div className="text">{product.name}</div>
                                            <div className="price">{product.cost.slice(0, -3).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")}₮</div>
                                        </div>

                                        {this.props.checkingInOrder(product.id) ? (
                                        <div className="dood">
                                            <button
                                            type="button"
                                            className="btn btn-danger rounded-0 perc-50"
                                            onClick={() =>
                                                this.props.product_minus(
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
                                            className="btn btn-success rounded-0 perc-50"
                                            onClick={() =>
                                                this.props.product_plus(
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
                                            className="btn btn-success rounded-0 perc-100"
                                            onClick={() =>
                                                this.props.product_plus(
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
            </>
        );
    }
}
