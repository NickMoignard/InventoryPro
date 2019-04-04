import React from 'react'
import PropTypes from "prop-types"
import SearchBar from '../../components/SearchBar'

import {
    AppProvider, Page, Card, ResourceList, Avatar, TextStyle, DisplayText
} from '@shopify/polaris'

import { findIndex } from 'lodash'

class ProductApp extends React.Component {
    constructor(props){
        super(props)

        this.state = { products: this.props.data }
    }

    renderItem = (item) => {

        const {id, name, quantity} = item;

        return (
                <ResourceList.Item
                id={id}
                quantity={quantity}
                accessibilityLabel={`View details for ${name}`}
                >
                <h3>
                    <TextStyle variation="strong">{name}</TextStyle>
                </h3>
                    
                </ResourceList.Item>
        )
    }

    

    render() {

        return(
            <AppProvider>
                <Page title="Products">
                    
                    <Card>
                        
                        <ResourceList
                            resourceName={{singular: 'product', plural: 'products'}}
                            items={this.state.products}
                            renderItem={this.renderItem}
                        />
                    </Card>

                    <Card>
                        <SearchBar autocomplete_data={this.props.autocomplete_data}/>
                    </Card>
                </Page>
            </AppProvider>
        )}

}


export default ProductApp