import React from 'react'
import ReactDOM from 'react-dom'

export function reactInit(id, Component, data_autocomplete = 'data-autocomplete') {
    document.addEventListener('DOMContentLoaded', () => {
        const node = document.getElementById(id)
        const products_node = document.getElementById(data_autocomplete)
        const data = JSON.parse(node.getAttribute('data'))
        const autocomplete_json = JSON.parse(node.getAttribute(data_autocomplete))
        ReactDOM.render(<Component data={data} autocomplete_data={autocomplete_json} />, node)
    });
}

