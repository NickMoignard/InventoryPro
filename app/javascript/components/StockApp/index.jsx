import React from 'react'
import PropTypes from 'prop-types'
import {
    AppProvider, Page, Card, ResourceList, Avatar, TextStyle 
} from '@shopify/polaris'

class StockApp extends React.Component {
    constructor(props){
        super(props)
    }

    renderItem = (item) => {
        const {id, name, quantity} = item;
        const media = <Avatar customer size="medium" name={name} />;

        return (
            <ResourceList.Item
            id={id}
            quantity={quantity}
            media={media}
            accessibilityLabel={`View details for ${name}`}
            >
            <h3>
                <TextStyle variation="strong">{name}</TextStyle>
            </h3>
            
            </ResourceList.Item>
        )
    }
    render() {
        const{data: stocks} = this.props;
        return(
            <AppProvider>
                <Page title="Stocks">
                    <Card>
                        <ResourceList
                            resourceName={{singular: 'customer', plural: 'customers'}}
                            items={stocks}
                            renderItem={this.renderItem}
                        />
                    </Card>
                </Page>
            </AppProvider>
        )}

}


export default StockApp