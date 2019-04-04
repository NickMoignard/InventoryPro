import React from "react";
import PropTypes from "prop-types";
import {AppProvider, Page} from "@shopify/polaris";
import HelloWorld from "./HelloWorld";

class DefaultPage extends React.Component {
  render () {
    return (
        <AppProvider>
          <Page title={this.props.title}>
            <p>Page content</p>
          </Page>
        </AppProvider>
    );
  }
}

DefaultPage.propTypes = {
  title: PropTypes.string
};

export default DefaultPage
