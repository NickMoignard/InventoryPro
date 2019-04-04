import React from 'react';
import {
  ResourceList,
  Avatar,
  TextStyle,
} from '@shopify/polaris';
import '@shopify/polaris/styles.css';

export default function ProductListItem(props) {

    const {id, name, quantity} = item;
    const titleStyle = {
      
    };
    const quantityStyle = {

    };
    return (
            <ResourceList.Item
            id={id}
            quantity={quantity}
            accessibilityLabel={`View details for ${name}`}
            >
            <h3 style={titleStyle}>
                <TextStyle variation="strong">{name}</TextStyle>
            </h3>
            <p>
              
            </p>
                
            </ResourceList.Item>
    )
}

