import React from 'react'
import {TextField} from '@shopify/polaris'

class Stepper extends React.Component {
    
    constructor(props){
        super(props)
        state = {
            value: this.props
        };
    }

  
    handleChange = (value) => {
      this.setState({value});
    };
  
    render() {
      return (
        <TextField
          label="Quantity"
          type="number"
          value={this.state.value}
          onChange={this.handleChange}
        />
      );
    }
  }
  export default Stepper