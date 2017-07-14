//this is the ENTRY file for webpack (where it starts when bundling)

import React from 'react';
import ReactDOM from 'react-dom';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<h1>Hey there, benchseekers!</h1>, root);
});
