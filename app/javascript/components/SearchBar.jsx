import React from 'react'
import ReactDOM from 'react-dom'
import {Autocomplete, Icon,  TextField} from "@shopify/polaris"
import PropTypes from "prop-types"


class SearchBar extends React.Component {
    options = this.props.autocomplete_data

    state = {
      selected: [],
      inputText: '',
      options: this.options
    };
  
    render() {
      const textField = (
        <Autocomplete.TextField
          onChange={this.updateText}
          label=""
          value={this.state.inputText}
          prefix={<Icon source="search" color="inkLighter" />}
          placeholder="Search"
        />
      );
      return (
        <div style={{padding: '1.2rem 2rem'}}>
          <Autocomplete
            options={this.state.options}
            selected={this.state.selected}
            onSelect={this.updateSelection}
            textField={textField}
          />
        </div>
      );
    }
  
    updateText = (newValue) => {
      this.setState({inputText: newValue});
      this.filterAndUpdateOptions(newValue);
    };
  
    filterAndUpdateOptions = (inputString) => {
      if (inputString === '') {
        this.setState({
          options: this.options,
        });
        return;
      }
  
      const filterRegex = new RegExp(inputString, 'i');
      const resultOptions = this.options.filter((option) =>
        option.label.match(filterRegex),
      );
      this.setState({
        options: resultOptions,
      });
    };
  
    updateSelection = (selected) => {
      const selectedText = selected.map((selectedItem) => {
        const matchedOption = this.options.find((option) => {
          return option.value.match(selectedItem);
        });
        return matchedOption && matchedOption.label;
      });
      this.setState({selected, inputText: selectedText});
    };
  }

  SearchBar.propTypes = {
      autocomplete_data: PropTypes.array
  }

  export default SearchBar